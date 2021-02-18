import 'package:Test01/domain/usecase/get_repos.dart';
import 'package:Test01/presentation/bloc/repos/repos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReposBloc extends Bloc<ReposEvent, ReposState> {
  GetRepos getRepos;

  ReposBloc({this.getRepos}) : super(ReposLoadInitial());

  @override
  Stream<ReposState> mapEventToState(ReposEvent event) async* {
    if (event is ReposLoadEvent) {
      yield ReposLoading();

      final result = await getRepos(event.userName);

      yield result.fold(
        (l) => ReposLoadError(message: l.errorMessage),
        (r) => ReposLoadSucess(repositories: r),
      );
    }
  }
}
