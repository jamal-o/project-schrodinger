import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:redux/redux.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/controller/local_storage/app_shared_preferences.dart';
import 'package:uni/controller/local_storage/file_offline_storage.dart';
import 'package:uni/controller/parsers/parser_exams.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:uni/redux/actions.dart';
import 'package:uni/redux/refresh_items_action.dart';

Future loadReloginInfo(Store<AppState> store) async {
  final Tuple2<String, String> userPersistentCredentials =
      await AppSharedPreferences.getPersistentUserInfo();
  final String userName = userPersistentCredentials.item1;
  final String password = userPersistentCredentials.item2;
  final List<String> faculties = await AppSharedPreferences.getUserFaculties();

  if (userName != '' && password != '') {
    final action = Completer();
    store.dispatch(reLogin(userName, password, faculties, action: action));
    return action.future;
  }
  return Future.error('No credentials stored');
}

Future loadUserInfoToState(store) async {
  loadLocalUserInfoToState(store);
  if (await Connectivity().checkConnectivity() != ConnectivityResult.none) {
    return loadRemoteUserInfoToState(store);
  }
}

Future loadRemoteUserInfoToState(Store<AppState> store) async {
  if (store.state.content['session'] == null) {
    return null;
  } else if (!store.state.content['session'].authenticated &&
      store.state.content['session'].persistentSession) {
    await loadReloginInfo(store);
  }

  final Completer<void> userInfo = Completer(),
      ucs = Completer(),
      exams = Completer(),
      schedule = Completer(),
      printBalance = Completer(),
      fees = Completer(),
      trips = Completer(),
      lastUpdate = Completer(),
      restaurants = Completer(),
      calendar = Completer();

  store.dispatch(getUserInfo(userInfo));
  store.dispatch(getUserPrintBalance(printBalance));
  store.dispatch(getUserFees(fees));
  store.dispatch(getUserBusTrips(trips));
  store.dispatch(getRestaurantsFromFetcher(restaurants));
  store.dispatch(getCalendarFromFetcher(calendar));

  final Tuple2<String, String> userPersistentInfo =
      await AppSharedPreferences.getPersistentUserInfo();
  userInfo.future.then((value) {
    store.dispatch(getUserExams(exams, ParserExams(), userPersistentInfo));
    store.dispatch(getUserSchedule(schedule, userPersistentInfo));
    store.dispatch(getCourseUnitsAndCourseAverages(ucs));
  });

  final allRequests = Future.wait([
    ucs.future,
    exams.future,
    schedule.future,
    printBalance.future,
    fees.future,
    userInfo.future,
    trips.future,
    restaurants.future,
    calendar.future
  ]);
  allRequests.then((futures) {
    store.dispatch(setLastUserInfoUpdateTimestamp(lastUpdate));
  });
  return lastUpdate.future;
}

void loadLocalUserInfoToState(store) async {
  store.dispatch(
      UpdateFavoriteCards(await AppSharedPreferences.getFavoriteCards()));
  store.dispatch(SetExamFilter(await AppSharedPreferences.getFilteredExams()));
  store.dispatch(SetExamHidden(await AppSharedPreferences.getHiddenExams()));
  store.dispatch(
      SetUserFaculties(await AppSharedPreferences.getUserFaculties()));
  final Tuple2<String, String> userPersistentInfo =
      await AppSharedPreferences.getPersistentUserInfo();
  if (userPersistentInfo.item1 != '' && userPersistentInfo.item2 != '') {
    store.dispatch(updateStateBasedOnLocalProfile());
    store.dispatch(updateStateBasedOnLocalUserExams());
    store.dispatch(updateStateBasedOnLocalUserLectures());
    store.dispatch(updateStateBasedOnLocalUserBusStops());
    store.dispatch(updateStateBasedOnLocalRefreshTimes());
    store.dispatch(updateStateBasedOnLocalTime());
    store.dispatch(updateStateBasedOnLocalCalendar());
    store.dispatch(updateRestaurantsBasedOnLocalData());
    store.dispatch(updateStateBasedOnLocalCourseUnits());
    store.dispatch(SaveProfileStatusAction(RequestStatus.successful));
    store.dispatch(SetPrintBalanceStatusAction(RequestStatus.successful));
    store.dispatch(SetFeesStatusAction(RequestStatus.successful));
  }
  final Completer locations = Completer();
  store.dispatch(getFacultyLocations(locations));
}

Future<void> handleRefresh(store) {
  final action = RefreshItemsAction();
  store.dispatch(action);
  return action.completer.future;
}

Future<File?> loadProfilePicture(Store<AppState> store,
    {forceRetrieval = false}) {
  final String studentNumber = store.state.content['session'].studentNumber;
  final String faculty = store.state.content['session'].faculties[0];
  final String url =
      'https://sigarra.up.pt/$faculty/pt/fotografias_service.foto?pct_cod=$studentNumber';
  final Map<String, String> headers = <String, String>{};
  headers['cookie'] = store.state.content['session'].cookies;
  return loadFileFromStorageOrRetrieveNew('user_profile_picture', url, headers,
      forceRetrieval: forceRetrieval);
}
