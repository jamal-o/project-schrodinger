import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uni/view/common_widgets/pages_layouts/general/general.dart';
import 'package:uni/view/about/widgets/terms_and_conditions.dart';

class AboutPageView extends StatefulWidget {
  const AboutPageView({super.key});

  @override
  State<StatefulWidget> createState() => AboutPageViewState();
}

/// Manages the 'about' section of the app.
class AboutPageViewState extends GeneralPageViewState {
  @override
  Widget getBody(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    return ListView(
      children: <Widget>[
        SvgPicture.asset(
          'assets/images/ni_logo.svg',
          color: Theme.of(context).primaryColor,
          width: queryData.size.height / 7,
          height: queryData.size.height / 7,
        ),
        Center(
            child: Padding(
          padding: EdgeInsets.only(
              left: queryData.size.width / 12,
              right: queryData.size.width / 12,
              top: queryData.size.width / 12,
              bottom: queryData.size.width / 12),
          child: Column(children: const <Widget>[
            TermsAndConditions(),
          ]),
        ))
      ],
    );
  }
}
