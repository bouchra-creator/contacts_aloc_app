import 'package:contact_block_app/bloc/contact.actions.dart';
import 'package:flutter/material.dart';

import 'button.widget.dart';

class ButtonBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonWidget(
              buttonLabel: 'All contacts',
              contactEvent: new LoadAllContactEvent()),
          ButtonWidget(
              buttonLabel: 'Student', contactEvent: new LoadStudentEvent()),
          ButtonWidget(
              buttonLabel: 'Developer',
              contactEvent: new LoadDeveloperEvent())
        ],
      ),
    );
  }
}