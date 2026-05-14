// import 'package:admin/responsive.dart';
// import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:admin/screens/factory_layout/diagram.dart';
import 'package:admin/screens/factory_layout/plan_info.dart';
// import 'package:admin/screens/factory_layout/draggable_line.dart';
import 'package:admin/screens/factory_layout/layout.dart';
// import 'package:admin/screens/factory_layout/layout.dart';
// import 'package:admin/screens/factory_layout/main_image.dart';
// import 'package:admin/screens/factory_layout/show_card.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/header.dart';

// import 'components/recent_files.dart';
// import 'components/storage_details.dart';
class FactoryLayoutScreen extends StatefulWidget {

  const FactoryLayoutScreen({super.key});

  @override
  State<FactoryLayoutScreen> createState() => _FactoryLayoutScreenState();
}

class _FactoryLayoutScreenState extends State<FactoryLayoutScreen> {
  final GlobalKey<PlanInfoState> showPlan = GlobalKey<PlanInfoState>();
  final GlobalKey<ShowBarChartState> ShowBar = GlobalKey<ShowBarChartState>();
@override
Widget build(BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Header(),
          SizedBox(height: defaultPadding),
          Expanded(child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Layout(
                  updateEmployeesCallBack: () {
                    showPlan.currentState?.updateEmployeesDisplay();
                  },
                  updataListCallBack: () {
                    ShowBar.currentState?.updateListDisplay();
                  },
                ),
              ),
              SizedBox(width: defaultPadding),
              Expanded(
                flex: 2,
                child: Column(children: [
                  Expanded(
                    flex: 3,
                    child: PlanInfo(
                      key: showPlan,
                    )),
                  SizedBox(height: defaultPadding,),
                  Expanded(
                    flex: 2,
                    child: ShowBarChart(
                      key: ShowBar,
                    )),
                ]), // Wrap DealInfo with Expanded widget
              ),
            ],
          ),)
          
        ],
      ),
    ),
  );
}

}