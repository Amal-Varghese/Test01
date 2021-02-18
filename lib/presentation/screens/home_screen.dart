import 'package:Test01/core/di/get_it.dart';
import 'package:Test01/domain/entity/search_entity.dart';
import 'package:Test01/presentation/bloc/repos/repos.dart';
import 'package:Test01/presentation/bloc/search/search_bloc.dart';
import 'package:Test01/presentation/bloc/search/search_event.dart';
import 'package:Test01/presentation/bloc/search/search_state.dart';
import 'package:Test01/presentation/bloc/user/user.dart';
import 'package:Test01/presentation/bloc/user/user_bloc.dart';
import 'package:Test01/presentation/bloc/user/user_event.dart';
import 'package:Test01/presentation/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SearchBloc _searchBloc;
  List<SearchEnity> _searchItems;
  bool _isLoading;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _searchBarController;

  @override
  void initState() {
    _searchBloc = getit<SearchBloc>();
    _searchItems = List();
    _isLoading = false;
    _searchBarController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _searchBloc,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: Stack(
              children: [
                BlocListener<SearchBloc, SearchState>(
                  listener: (context, state) {
                    if (state is SearchLoading) {
                      setState(() {
                        _isLoading = true;
                      });
                    }
                    if (state is SearchLoadError) {
                       Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('${state.message}')));
                      setState(() {
                        _isLoading = false;
                      });
                    }
                    if (state is SearchLoadSucess) {
                      _searchItems = state.users;
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  },
                  child: Container(),
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    searchBar(),
                    listItems(),
                  ],
                ),
                _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: _searchBarController,
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: 'Search User by username',
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none),
          validator: (val) {
            if (val.isEmpty) {
              return '';
            } else
              return null;
          },
          onFieldSubmitted: (value) {
            if (_formKey.currentState.validate()) {
              _searchBloc.add(SearchLoadEvent(userName: value));
            }
          },
        ),
      ),
    );
  }

  Widget listItems() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _searchItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            child: Image.network(_searchItems[index].userImg),
          ),
          title: Text(_searchItems[index].userName),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      userName: _searchItems[index].userName,
                    )));
          },
        );
      },
    );
  }
}
