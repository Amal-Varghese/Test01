import 'package:Test01/domain/usecase/get_users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './search.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  GetUsers getUsers;

  SearchBloc({this.getUsers}) : super(SearchLoadInitial());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchLoadEvent) {
      yield SearchLoading();

      final result = await getUsers(event.userName);

      yield result.fold(
        (l) => SearchLoadError(message: l.errorMessage),
        (r) => SearchLoadSucess(users: r),
      );
    }
  }
}
