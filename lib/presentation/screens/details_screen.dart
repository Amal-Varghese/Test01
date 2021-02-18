import 'package:Test01/core/di/get_it.dart';
import 'package:Test01/domain/entity/repos_entity.dart';
import 'package:Test01/domain/entity/user_entity.dart';
import 'package:Test01/presentation/bloc/repos/repos.dart';
import 'package:Test01/presentation/bloc/user/user.dart';
import 'package:Test01/presentation/screens/repos_screen.dart';
import 'package:Test01/presentation/screens/user_info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  String userName;
  DetailsScreen({this.userName});
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ReposBloc _reposBloc;
  UserBloc _userBloc;
  final Map<int, Widget> logoWWidgets = const <int, Widget>{
    0: Text('User Info'),
    1: Text('Repositories'),
  };
  int _pageIndex = 0;
  bool _isLoading;
  bool _isSuccess;
  List<ReposEntity> _repositories;
  UserEntity _userEntity;

  @override
  void initState() {
    _reposBloc = getit<ReposBloc>();
    _userBloc = getit<UserBloc>();
    _isLoading = false;
    _isSuccess = false;
    _userBloc.add(UserLoadEvent(userName: widget.userName));
    _repositories = List();
    super.initState();
  }

  @override
  void dispose() {
    _reposBloc.close();
    _userBloc.close();
    _pageIndex = 0;
    if (_repositories != null) {
      _repositories.clear();
    }
    if (_userEntity != null) {
      _userEntity = null;
    }
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _reposBloc),
        BlocProvider(create: (context) => _userBloc),
      ],
      child: Container(
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                BlocListener<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is UserLoading) {
                      setState(() {
                        _isLoading = true;
                        _isSuccess = false;
                      });
                    }
                    if (state is UserLoadError) {
                      setState(() {
                        _isLoading = false;
                        _isSuccess = false;
                      });
                    }
                    if (state is UserLoadSucess) {
                      _userEntity = state.user;
                      setState(() {
                        _isLoading = false;
                        _isSuccess = true;
                      });
                    }
                  },
                  child: Container(),
                ),
                BlocListener<ReposBloc, ReposState>(
                  listener: (context, state) {
                    if (state is ReposLoading) {
                      if (_repositories != null) {
                        _repositories.clear();
                      }
                      setState(() {
                        _isLoading = true;
                        _isSuccess = false;
                      });
                    }
                    if (state is ReposLoadError) {
                      setState(() {
                        _isLoading = false;
                        _isSuccess = false;
                      });
                    }
                    if (state is ReposLoadSucess) {
                      state.repositories.forEach((element) {
                        if (element != null) {
                          if (element.desc != null &&
                              element.repoName != null) {
                            _repositories.add(element);
                          }
                        }
                      });
                      setState(() {
                        _isLoading = false;
                        _isSuccess = true;
                      });
                    }
                  },
                  child: Container(),
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    appbar(),
                    segmentBuilder(),
                    _isSuccess
                        ? _pageIndex == 0
                            ? UserInfoScreen(
                                userEntity: _userEntity,
                              )
                            : ReposScreen(
                                repositories: _repositories,
                              )
                        : Container(),
                  ],
                ),
                _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appbar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: 50,
      color: Colors.white,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 24,
              height: 24,
              child: Icon(Icons.arrow_back_outlined),
            ),
          )
        ],
      ),
    );
  }

  Widget segmentBuilder() {
    return Container(
      padding: EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      height: 70,
      child: CupertinoSegmentedControl(
        selectedColor: Colors.white,
        unselectedColor: Colors.blue,
        borderColor: Colors.white,
        children: logoWWidgets,
        onValueChanged: (int val) {
          setState(() {
            _pageIndex = val;
          });

          if (_pageIndex == 0) {
            _userBloc.add(UserLoadEvent(userName: widget.userName));
          }

          if (_pageIndex == 1) {
            _reposBloc.add(ReposLoadEvent(userName: widget.userName));
          }
          if (_repositories.isEmpty) {
            _repositories.clear();
          }
          if (_userEntity != null) {
            _userEntity = null;
          }
        },
        groupValue: _pageIndex,
      ),
    );
  }
}
