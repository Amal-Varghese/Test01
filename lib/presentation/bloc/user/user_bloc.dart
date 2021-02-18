import 'package:Test01/domain/usecase/get_user_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  GetUserInfo getUserInfo;

  UserBloc({this.getUserInfo}) : super(UserLoadInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoadEvent) {
      yield UserLoading();

      final result = await getUserInfo(event.userName);

      yield result.fold(
        (l) => UserLoadError(message: l.errorMessage),
        (r) => UserLoadSucess(user: r),
      );
    }
  }
}
