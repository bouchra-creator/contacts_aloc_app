import 'package:contact_block_app/bloc/contact.actions.dart';
import 'package:contact_block_app/bloc/contact.bloc.dart';
import 'package:contact_block_app/bloc/contact.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonWidget extends StatelessWidget {
  String buttonLabel;
  ContactEvent contactEvent;

  ButtonWidget({this.buttonLabel, this.contactEvent});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
      return Container(
          padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
          decoration: BoxDecoration(
              border: Border.all(
                  width: (state.currentEvent.runtimeType ==
                      contactEvent.runtimeType)
                      ? 2
                      : 0,
                  color: Colors.deepPurple)),
          child: RaisedButton(
            onPressed: () {
              context.read<ContactBloc>().add(contactEvent);
            },
            child: Text(
              buttonLabel,
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.deepPurple,
          ));
    });
  }
}