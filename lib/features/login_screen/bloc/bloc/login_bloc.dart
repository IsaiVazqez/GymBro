import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialState()) {
    @override
    Stream<LoginState> mapEventToState(LoginEvent event) async* {
      if (event is ShowLoginFieldsEvent) {
        yield ShowFieldsState();
      }
    }
  }
}
