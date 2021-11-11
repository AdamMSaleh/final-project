import 'package:flutter/material.dart';
import 'package:flutter_finalproject/Packages/Components/Additions/go_back.dart';
import 'package:intl/intl.dart';
import '../current_projects_for_workers.dart';
import '../list_of_payments_to_workers.dart';
import '../work_requests_for_workers.dart';

class LaborManagementForProfessionals extends StatefulWidget {
  const LaborManagementForProfessionals({Key? key}) : super(key: key);

  @override
  _LaborManagementForProfessionalsState createState() =>
      _LaborManagementForProfessionalsState();
}

class _LaborManagementForProfessionalsState
    extends State<LaborManagementForProfessionals> {
  int _selectedPageIndex = 0;

  void _selectedPageWidget(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Widget>> page = [
      {
        'page': const CurrentProjectsForWorkers().createState().build(context),
        'title': GoBack.tx('المشاريع الحالية للعمال'),
      },
      {
        'page': const ListOfPaymentsToWorkers().createState().build(context),
        'title': GoBack.tx('قائمة الدفعات للعمال'),
      },
      {
        'page': const WorkRequestsForWorkers().createState().build(context),
        'title': GoBack.tx('طلبات العمل للعمال'),
      },
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: page[_selectedPageIndex]['title'],
          centerTitle: true,
        ),
        body: page[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.amber,
          selectedItemColor: Colors.blueAccent,
          // unselectedItemColor: Colors.black54,
          showUnselectedLabels: true,
          currentIndex: _selectedPageIndex,
          selectedFontSize: 16,
          // type: BottomNavigationBarType.shifting,
          onTap: _selectedPageWidget,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: 'المشاريع',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cable),
              label: 'الدفعات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.align_vertical_center),
              label: 'الطلبات',
            ),
          ],
        ),
      ),
    );
  }
}
