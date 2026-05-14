// // import 'package:admin/responsive.dart';
// // import 'package:admin/screens/dashboard/components/my_fields.dart';
// import 'package:admin/screens/dashboard/main_image.dart';
// import 'package:admin/screens/dashboard/show_card.dart';
// import 'package:flutter/material.dart';

// import '../../constants.dart';
// import 'components/header.dart';

// // import 'components/recent_files.dart';
// // import 'components/storage_details.dart';

// class DashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: EdgeInsets.all(defaultPadding),
//         child: Column(
//           children: [
//             Header(),
//             SizedBox(height: defaultPadding),
//             Expanded(flex: 3, child: MainImage()),
//             SizedBox(
//               height: defaultPadding,
//             ),
//             Expanded(flex: 2, child: ShowCard()),

//             // Row(
//             //   crossAxisAlignment: CrossAxisAlignment.start,
//             //   children: [
//             //     Expanded(
//             //       flex: 5,
//             //       child: Column(
//             //         children: [
//             //           MyFiles(),
//             //           SizedBox(height: defaultPadding),
//             //           RecentFiles(),
//             //           if (Responsive.isMobile(context))
//             //             SizedBox(height: defaultPadding),
//             //           if (Responsive.isMobile(context)) StorageDetails(),
//             //         ],
//             //       ),
//             //     ),
//             //     if (!Responsive.isMobile(context))
//             //       SizedBox(width: defaultPadding),
//             //     // On Mobile means if the screen is less than 850 we don't want to show it
//             //     if (!Responsive.isMobile(context))
//             //       Expanded(
//             //         flex: 2,
//             //         child: StorageDetails(),
//             //       ),
//             //   ],
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/header.dart';
import 'main_image.dart';
import 'show_card.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Expanded(
              flex: 3,
              child: MainImage(),
            ),
            // SizedBox(height: defaultPadding),
            Expanded(
              flex: 2,
              child: ShowCard(),
            ),
            SizedBox(height: defaultPadding,)
          ],
        ),
      ),
    );
  }
}
