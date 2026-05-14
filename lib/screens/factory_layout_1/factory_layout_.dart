// import 'package:admin/responsive.dart';
// import 'package:admin/screens/dashboard/components/my_fields.dart';
// import 'package:admin/screens/factory_layout/layout.dart';
import 'package:admin/screens/factory_layout_1/layout.dart';
// import 'package:admin/screens/factory_layout/main_image.dart';
// import 'package:admin/screens/factory_layout/show_card.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/header.dart';

// import 'components/recent_files.dart';
// import 'components/storage_details.dart';

class FactoryLayoutShowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: 
        Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Expanded(child: LayoutShow()),
          ],
        ),
      ),
    );
  }
}
