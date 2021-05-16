import 'package:contact_block_app/bloc/messages/messages.bloc.dart';
import 'package:contact_block_app/repositories/contact.repo.dart';
import 'package:contact_block_app/repositories/message.repo.dart';
import 'package:contact_block_app/ui/pages/contactMessages/contactMessages.page.dart';
import 'package:contact_block_app/ui/pages/contacts/contact.page.dart';
import 'package:contact_block_app/ui/pages/messages/messages.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/contact.bloc.dart';
import 'bloc/contact.state.dart';
import 'bloc/messages/messages.state.dart';
import 'enums/enums.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => new ContactRepository());
  GetIt.instance.registerLazySingleton(() => new MessageRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => MessageBloc(MessageState.initialState(),
                GetIt.instance<MessageRepository>())),
        BlocProvider(
          create: (context) => ContactBloc(
              ContactState(
                  conatacts: [],
                  requesteState: RequesteState.NONE,
                  errorMessage: ''),
              GetIt.instance<ContactRepository>()),
        ),
      ],
      child: MaterialApp(
        title: 'Contact simulation',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        routes: {
          '/contacts': (context) => ContactPage(),
          '/messages': (context) => MessagesPage(),
          '/contacts-messages': (context) => ContactMessagePage(),
        },
        initialRoute: '/contacts',
      ),
    );
  }
}


