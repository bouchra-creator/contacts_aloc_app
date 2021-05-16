import 'package:bloc/bloc.dart';
import 'package:contact_block_app/enums/enums.dart';
import 'package:contact_block_app/model/contact.model.dart';
import 'package:contact_block_app/repositories/contact.repo.dart';

import 'contact.actions.dart';
import 'contact.state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactRepository contactRepository;
  ContactBloc(ContactState initialState, this.contactRepository)
      : super(initialState);

  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is LoadAllContactEvent) {
      yield ContactState(
          conatacts: state.conatacts,
          requesteState: RequesteState.LOADING,
          currentEvent: event);
      try {
        List<Contact> data = await contactRepository.allContacts();
        yield ContactState(
            conatacts: data,
            requesteState: RequesteState.LOADED,
            currentEvent: event);
      } catch (e) {
        yield ContactState(
            conatacts: state.conatacts,
            requesteState: RequesteState.ERROR,
            errorMessage: e.message,
            currentEvent: event);
      }
    } else if (event is LoadStudentEvent) {
      yield ContactState(
          conatacts: state.conatacts,
          requesteState: RequesteState.LOADING,
          currentEvent: event);
      try {
        List<Contact> data = await contactRepository.contactsByType("Student");
        yield ContactState(
            conatacts: data,
            requesteState: RequesteState.LOADED,
            currentEvent: event);
      } catch (e) {
        yield ContactState(
            conatacts: state.conatacts,
            requesteState: RequesteState.ERROR,
            errorMessage: e.message,
            currentEvent: event);
      }
    } else if (event is LoadDeveloperEvent) {
      yield ContactState(
          conatacts: state.conatacts,
          requesteState: RequesteState.LOADING,
          currentEvent: event);
      try {
        List<Contact> data =
        await contactRepository.contactsByType("Developer");
        yield ContactState(
            conatacts: data,
            requesteState: RequesteState.LOADED,
            currentEvent: event);
      } catch (e) {
        yield ContactState(
            conatacts: state.conatacts,
            requesteState: RequesteState.ERROR,
            errorMessage: e.message,
            currentEvent: event);
      }
    }
  }
}
