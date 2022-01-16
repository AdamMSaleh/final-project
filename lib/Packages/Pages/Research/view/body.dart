// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, duplicate_ignore, implementation_imports, unused_import, avoid_print, unnecessary_null_comparison, prefer_is_empty, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/DataBase/register.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/Drawer/drawer.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/appbar.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
import 'package:flutter_finalproject/Packages/Pages/Invoice/Components/design.dart';
import 'package:flutter_finalproject/Packages/Pages/NewProject/View/new_project.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/Components/support/support_class.dart';
import 'package:flutter_finalproject/Packages/Pages/Research/view/search_page.dart';
import 'package:flutter_finalproject/Theme/app_color.dart';
import 'package:flutter_finalproject/Theme/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_crafts.dart';

class Research extends StatefulWidget {
  const Research({Key? key}) : super(key: key);
  static const String id = 'Research';

  @override
  State<Research> createState() => _ResearchState();
}

class _ResearchState extends State<Research> {
  List<Person> people = [];

  x() async {
    Person.people = [];
    await Person.getDataPerson();
    setState(() {
      print('allanlananlalnlna');
      print(people.length);
    });
  }

  @override
  initState() {
    x();
    people = Person.people;
    // setState(() {
    //   if(NewProject.ownerName!.length>1){
    //     Navigator.pop (context ,NewProject.id);
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('samisamisasmaismasimsi');
    // print(people[1].craftsmanship);
    setState(() {
      // getDataPerson();
      // tate();
      // (() =>   Person.getDataPerson())();

      print('allanlananlalnlna');
      print(people.length);
    });
    return Scaffold(
      //*Appbar
      appBar: AppBSup(
        txt: KeyLang.research,
      ),

      body: Container(
        height: (MediaQuery.of(context).size.height) * 0.75,
        child: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            final Person person = people[index];
            if (people == null || people.length == 0) {
              return CircularProgressIndicator(); //you should see loading animation if list is empty
            }
            return ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => AddCrafts(
                        name: person.name!,
                        age: person.age!,
                        craftsmanship: person.craftsmanship!,
                        userNo: person.userNo!,
                        location: person.location!,
                        phoneNumber: person.phoneNumber!,
                        image: person.image!,
                      ))),
              title: Text(person.name!),
              subtitle: Text(person.craftsmanship!),
              trailing: Text('الرقم التعريفي :  ${person.userNo}'),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: project_color('741b47'),
        tooltip: 'Search people',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<Person>(
            onQueryUpdate: (s) => print(s),
            items: people,
            searchLabel: 'بحث ',
            suggestion: const Center(
              child: Text('تصفية الناس بالاسم أو المهنة أو الرقم التعريفي'),
            ),
            failure: const Center(
              child: Text('لم يتم العثور على أي شخص :('),
            ),
            filter: (person) => [
              person.name,
              person.craftsmanship,
              person.userNo.toString(),
            ],
            builder: (person) => ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => AddCrafts(
                        name: person.name!,
                        age: person.age!,
                        craftsmanship: person.craftsmanship!,
                        userNo: person.userNo!,
                        location: person.location!,
                        phoneNumber: person.phoneNumber!,
                        image: person.image!,
                      ))),
              title: Text(person.name!),
              subtitle: Text(person.craftsmanship!),
              trailing: Text('الرقم التعريفي :${person.userNo}'),
            ),
          ),
        ),
        child: Icon(Icons.search),
      ),
    );
  }
}
