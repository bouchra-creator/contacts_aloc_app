import 'package:contact_block_app/bloc/contact.bloc.dart';
import 'package:contact_block_app/bloc/contact.state.dart';
import 'package:contact_block_app/enums/enums.dart';
import 'package:contact_block_app/ui/pages/widgets/contact.action.button.dart';
import 'package:contact_block_app/ui/pages/widgets/contact.bar.widget.dart';
import 'package:contact_block_app/ui/pages/widgets/retry.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Column(
        children: [
          ButtonBarWidget(),
          Expanded(child: BlocBuilder<ContactBloc, ContactState>(
              builder: (context, state) {
                if (state.requesteState == RequesteState.LOADING) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.requesteState == RequesteState.ERROR) {
                  return RetryWidget(
                    errorMessage: state.errorMessage,
                    onAction: () {
                      context.read<ContactBloc>().add(state.currentEvent);
                    },
                  );
                } else if (state.requesteState == RequesteState.LOADED) {
                  return ContactListWidget(contacts: state.conatacts);
                } else {
                  return Container();
                }
              }))
        ],
      ));
}
}