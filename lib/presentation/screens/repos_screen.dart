import 'package:Test01/domain/entity/repos_entity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReposScreen extends StatefulWidget {
  List<ReposEntity> repositories;
  ReposScreen({this.repositories});
  @override
  _ReposScreenState createState() => _ReposScreenState();
}

class _ReposScreenState extends State<ReposScreen> {
  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.repositories.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(widget.repositories[index].repoName.isEmpty
              ? ''
              : widget.repositories[index].repoName),
          subtitle: Text(widget.repositories[index].desc.isEmpty
              ? ''
              : widget.repositories[index].desc),
          onTap: () {
            _launchUrl(widget.repositories[index].url);
          },
        );
      },
    );
  }
}
