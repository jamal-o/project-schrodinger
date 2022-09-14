import 'package:flutter/material.dart';
import 'package:uni/view/Widgets/link_button.dart';
import 'package:uni/view/Widgets/generic_expansion_card.dart';

/// Manages the 'Current account' section inside the user's page (accessible
/// through the top-right widget with the user picture)
class OtherLinksCard extends GenericExpansionCard {
  const OtherLinksCard({Key? key}) : super(key: key);

  @override
  Widget buildCardContent(BuildContext context) {
    return Column(children: const [
      LinkButton(title: 'Impressão', link: 'https://print.up.pt')
    ]);
  }

  @override
  String getTitle() => 'Outros Links';
}