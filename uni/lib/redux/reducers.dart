import 'package:logger/logger.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/redux/actions.dart';

AppState appReducers(AppState state, dynamic action) {
  if (action is SaveLoginDataAction) {
    return login(state, action);
  } else if (action is SetLoginStatusAction) {
    return setLoginStatus(state, action);
  } else if (action is SetExamsAction) {
    return setExams(state, action);
  } else if (action is SetExamsStatusAction) {
    return setExamsStatus(state, action);
  } else if (action is SetScheduleStatusAction) {
    return setScheduleStatus(state, action);
  } else if (action is SetScheduleAction) {
    return setSchedule(state, action);
  } else if (action is SaveProfileAction) {
    return saveProfile(state, action);
  } else if (action is SaveProfileStatusAction) {
    return saveProfileStatus(state, action);
  } else if (action is SaveCurrentUcsAction) {
    return saveCurrUcs(state, action);
  } else if (action is SaveAllUcsAction) {
    return saveAllUcs(state, action);
  } else if (action is SaveAllUcsActionStatus) {
    return saveAllUcsStatus(state, action);
  } else if (action is SetPrintBalanceAction) {
    return setPrintBalance(state, action);
  } else if (action is SetPrintBalanceStatusAction) {
    return setPrintBalanceStatus(state, action);
  } else if (action is SetFeesBalanceAction) {
    return setFeesBalance(state, action);
  } else if (action is SetFeesLimitAction) {
    return setFeesLimit(state, action);
  } else if (action is SetFeesStatusAction) {
    return setFeesStatus(state, action);
  } else if (action is SetBusTripsAction) {
    return setBusTrips(state, action);
  } else if (action is SetBusStopsAction) {
    return setBusStop(state, action);
  } else if (action is SetBusTripsStatusAction) {
    return setBusStopStatus(state, action);
  } else if (action is SetBusStopTimeStampAction) {
    return setBusStopTimeStamp(state, action);
  } else if (action is UpdateFavoriteCards) {
    return updateFavoriteCards(state, action);
  } else if (action is SetPrintRefreshTimeAction) {
    return setPrintRefreshTime(state, action);
  } else if (action is SetFeesRefreshTimeAction) {
    return setFeesRefreshTime(state, action);
  } else if (action is SetInitialStoreStateAction) {
    return setInitialStoreState(state, action);
  } else if (action is SetHomePageEditingMode) {
    return setHomePageEditingMode(state, action);
  } else if (action is SetLastUserInfoUpdateTime) {
    return setLastUserInfoUpdateTime(state, action);
  } else if (action is SetExamFilter) {
    return setExamFilter(state, action);
  } else if (action is SetExamHidden) {
    return setExamHidden(state, action);
  } else if (action is SetLocationsAction) {
    return setLocations(state, action);
  } else if (action is SetLocationsStatusAction) {
    return setLocationsStatus(state, action);
  } else if (action is SetUserFaculties) {
    return setUserFaculties(state, action);
  } else if (action is SetRestaurantsAction) {
    return setRestaurantsAction(state, action);
  } else if (action is SetRestaurantsStatusAction) {
    return setRestaurantsStatusAction(state, action);
  } else if (action is SetCalendarAction) {
    return setCalendarAction(state, action);
  } else if (action is SetCalendarStatusAction) {
    return setCalendarStatus(state, action);
  }
  return state;
}

AppState login(AppState state, SaveLoginDataAction action) {
  Logger().i('setting state: ${action.session}');
  return state.cloneAndUpdateValue('session', action.session);
}

AppState setLoginStatus(AppState state, SetLoginStatusAction action) {
  Logger().i('setting login status: ${action.status}');
  return state.cloneAndUpdateValue('loginStatus', action.status);
}

AppState setExams(AppState state, SetExamsAction action) {
  Logger().i('setting exams: ${action.exams.length}');
  return state.cloneAndUpdateValue('exams', action.exams);
}

AppState setCalendarAction(AppState state, SetCalendarAction action) {
  Logger().i('setting calendar: ${action.calendar.length.toString()}');
  return state.cloneAndUpdateValue('calendar', action.calendar);
}

AppState setCalendarStatus(AppState state, SetCalendarStatusAction action) {
  Logger().i('setting calendar status: ${action.status}');
  return state.cloneAndUpdateValue('calendarStatus', action.status);
}

AppState setRestaurantsAction(AppState state, SetRestaurantsAction action) {
  Logger().i('setting restaurants: ${action.restaurants.length}');
  return state.cloneAndUpdateValue('restaurants', action.restaurants);
}

AppState setRestaurantsStatusAction(
    AppState state, SetRestaurantsStatusAction action) {
  Logger().i('setting restaurants status: ${action.status}');
  return state.cloneAndUpdateValue('restaurantsStatus', action.status);
}

AppState setExamsStatus(AppState state, SetExamsStatusAction action) {
  Logger().i('setting exams status: ${action.status}');
  return state.cloneAndUpdateValue('examsStatus', action.status);
}

AppState setSchedule(AppState state, SetScheduleAction action) {
  Logger().i('setting schedule: ${action.lectures.length}');
  return state.cloneAndUpdateValue('schedule', action.lectures);
}

AppState setScheduleStatus(AppState state, SetScheduleStatusAction action) {
  Logger().i('setting schedule status: ${action.status}');
  return state.cloneAndUpdateValue('scheduleStatus', action.status);
}

AppState saveProfile(AppState state, SaveProfileAction action) {
  return state.cloneAndUpdateValue('profile', action.profile);
}

AppState saveProfileStatus(AppState state, SaveProfileStatusAction action) {
  Logger().i('setting profile status: ${action.status}');
  return state.cloneAndUpdateValue('profileStatus', action.status);
}

AppState saveCurrUcs(AppState state, SaveCurrentUcsAction action) {
  return state.cloneAndUpdateValue('currUcs', action.currUcs);
}

AppState saveAllUcs(AppState state, SaveAllUcsAction action) {
  Logger()
      .i('saving all user ucs: ${action.allUcs.map((e) => e.abbreviation)}');
  return state.cloneAndUpdateValue('allUcs', action.allUcs);
}

AppState saveAllUcsStatus(AppState state, SaveAllUcsActionStatus action) {
  Logger().i('setting all user ucs status: ${action.status}');
  return state.cloneAndUpdateValue('allUcsStatus', action.status);
}

AppState setPrintBalance(AppState state, SetPrintBalanceAction action) {
  Logger().i('setting print balance: ${action.printBalance}');
  return state.cloneAndUpdateValue('printBalance', action.printBalance);
}

AppState setPrintBalanceStatus(
    AppState state, SetPrintBalanceStatusAction action) {
  Logger().i('setting print balance status: ${action.status}');
  return state.cloneAndUpdateValue('printBalanceStatus', action.status);
}

AppState setFeesBalance(AppState state, SetFeesBalanceAction action) {
  Logger().i('setting fees balance: ${action.feesBalance}');
  return state.cloneAndUpdateValue('feesBalance', action.feesBalance);
}

AppState setFeesLimit(AppState state, SetFeesLimitAction action) {
  Logger().i('setting next fees limit: ${action.feesLimit}');
  return state.cloneAndUpdateValue('feesLimit', action.feesLimit);
}

AppState setFeesStatus(AppState state, SetFeesStatusAction action) {
  Logger().i('setting fees status: ${action.status}');
  return state.cloneAndUpdateValue('feesStatus', action.status);
}

AppState setBusStop(AppState state, SetBusStopsAction action) {
  Logger().i('setting bus stops: ${action.busStops}');
  return state.cloneAndUpdateValue('configuredBusStops', action.busStops);
}

AppState setBusTrips(AppState state, SetBusTripsAction action) {
  Logger().i('setting bus trips: ${action.trips}');
  return state.cloneAndUpdateValue('currentBusTrips', action.trips);
}

AppState setBusStopStatus(AppState state, SetBusTripsStatusAction action) {
  Logger().i('setting bus stop status: ${action.status}');
  return state.cloneAndUpdateValue('busStopStatus', action.status);
}

AppState setBusStopTimeStamp(AppState state, SetBusStopTimeStampAction action) {
  Logger().i('setting bus stop time stamp: ${action.timeStamp}');
  return state.cloneAndUpdateValue('timeStamp', action.timeStamp);
}

AppState setInitialStoreState(
    AppState state, SetInitialStoreStateAction action) {
  Logger().i('setting initial store state');
  return state.getInitialState();
}

AppState updateFavoriteCards(AppState state, UpdateFavoriteCards action) {
  return state.cloneAndUpdateValue('favoriteCards', action.favoriteCards);
}

AppState setPrintRefreshTime(AppState state, SetPrintRefreshTimeAction action) {
  Logger().i('setting print refresh time ${action.time}');
  return state.cloneAndUpdateValue('printRefreshTime', action.time);
}

AppState setFeesRefreshTime(AppState state, SetFeesRefreshTimeAction action) {
  Logger().i('setting fees refresh time ${action.time}');
  return state.cloneAndUpdateValue('feesRefreshTime', action.time);
}

AppState setHomePageEditingMode(AppState state, SetHomePageEditingMode action) {
  Logger().i('setting home page editing mode to ${action.state}');
  return state.cloneAndUpdateValue('homePageEditingMode', action.state);
}

AppState setLastUserInfoUpdateTime(
    AppState state, SetLastUserInfoUpdateTime action) {
  return state.cloneAndUpdateValue(
      'lastUserInfoUpdateTime', action.currentTime);
}

AppState setExamFilter(AppState state, SetExamFilter action) {
  Logger().i('setting exam type filter to ${action.filteredExams}');
  return state.cloneAndUpdateValue('filteredExams', action.filteredExams);
}

AppState setExamHidden(AppState state, SetExamHidden action) {
  Logger().i('setting hidden exams to ${action.hiddenExams}');
  return state.cloneAndUpdateValue('hiddenExams', action.hiddenExams);
}

AppState setLocations(AppState state, SetLocationsAction action) {
  Logger().i('setting locations: ${action.locationGroups.length}');
  return state.cloneAndUpdateValue('locationGroups', action.locationGroups);
}

AppState setLocationsStatus(AppState state, SetLocationsStatusAction action) {
  Logger().i('setting locations state to ${action.status}');
  return state.cloneAndUpdateValue('locationGroupsStatus', action.status);
}

AppState setUserFaculties(AppState state, SetUserFaculties action) {
  Logger().i('setting user faculty(ies) ${action.faculties}');
  return state.cloneAndUpdateValue('userFaculties', action.faculties);
}
