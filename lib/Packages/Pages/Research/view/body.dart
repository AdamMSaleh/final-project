// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, duplicate_ignore, implementation_imports, unused_import, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Language/generated/key_lang.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/Drawer/drawer.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/appbar.dart';
import 'package:flutter_finalproject/Packages/Components/Common_traits/appbar/sup_appbar.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/app_loading.dart';
import 'package:flutter_finalproject/Packages/Components/Loading/enum_loading.dart';
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
  static List<Person> people = [
    Person('محموداحمد ', 'حداد', 64),
    Person(' يوسف بسام', 'نجار', 30),
    Person(' ليث جيم', 'جهربجي', 55),
    Person('مخلد كرم', 'بليط', 67),
    Person('غليص فلاح', 'حداد', 39),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //*Appbar
      appBar: AppBSup(
        txt: KeyLang.research,
      ),

      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final Person person = people[index];
          return ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => AddCrafts(
                      name: person.name,
                      age: person.age,
                      craftsmanship: person.occupation,
                    ))),
            title: Text(person.name),
            subtitle: Text(person.occupation),
            trailing: Text('العمر :  ${person.age}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Search people',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<Person>(
            onQueryUpdate: (s) => print(s),
            items: people,
            searchLabel: 'بحث عن متخصص',
            suggestion: const Center(
              child: Text('تصفية الناس بالاسم أو المهنة أو العمر'),
            ),
            failure: const Center(
              child: Text('لم يتم العثور على أي شخص :('),
            ),
            filter: (person) => [
              person.name,
              person.occupation,
              person.age.toString(),
            ],
            builder: (person) => ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => AddCrafts(
                        name: person.name,
                        age: person.age,
                        craftsmanship: person.occupation,
                      ))),
              title: Text(person.name),
              subtitle: Text(person.occupation),
              trailing: Text('العمر :${person.age}'),
            ),
          ),
        ),
        child: Icon(Icons.search),
      ),
    );
  }
}
