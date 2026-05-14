// import 'package:admin/responsive.dart';
// import 'package:admin/screens/dashboard/components/my_fields.dart';
// import 'package:admin/screens/dashboard/main_image.dart';
// import 'package:admin/screens/dashboard/show_card.dart';
import 'package:flutter/material.dart';

// import '../../constants.dart';
// import 'components/header.dart';

import 'package:admin/screens/extinguisher/folding_cell_list_page.dart';
// import 'package:admin/screens/extinguisher/cell_content.dart';
// import 'folding_demo_page.dart';

// import 'components/recent_files.dart';
// import 'components/storage_details.dart';

class ExtinguisherScreen extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: FoldingDemoPage(),
      home: FoldingCellListPage(),
    );
    return materialApp;
  }

}
