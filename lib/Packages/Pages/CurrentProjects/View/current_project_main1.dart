// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';

import 'projects_details.dart' as zz;

class CurrentProjectMain extends StatefulWidget {
  final String str;
  const CurrentProjectMain(this.str, {Key? key}) : super(key: key);

  @override
  _CurrentProjectMainState createState() => _CurrentProjectMainState(str);
}

class _CurrentProjectMainState extends State<CurrentProjectMain> {
  String srt;
  _CurrentProjectMainState(this.srt);
  Future<bool> maybePop(BuildContext context) {
    return Navigator.of(context).maybePop(zz.ProjectsDetails("j"));
  }

  void selectScreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_ /*context*/) {
      return zz.ProjectsDetails("j");
    }));
  }

  int countOfProject = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('            المشاريع الحالية '),
        leading: GoBack.back(context),
      ),
      body: Column(
        children: [
          Text(srt),
          InkWell(
            onTap: () => selectScreen(context),
            child: const Center(
              child: Text(
                'Go To Screen 2',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
