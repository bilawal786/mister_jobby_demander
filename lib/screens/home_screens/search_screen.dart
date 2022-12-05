import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../widgets/const_widgets/search_input_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Search_Screen_AppBar_Title",
          style: Theme.of(context).textTheme.bodyLarge,
        ).tr(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SearchInputField(),
        ),
      ),
      body: Container(
        color: Colors.greenAccent.shade100,
        height: 50,
        width: 300,
        padding: const EdgeInsets.all(50),
      )






      // body: SingleChildScrollView(
      //   child: Container(
      //     padding: const EdgeInsets.all(10.0),
      //     child: Column(
      //       children: [
      //         (searchCategoriesData.searchCat == null ||
      //             searchCategoriesData.searchCat!.isEmpty)
      //             ?
      //         ListView.builder(
      //           padding: const EdgeInsets.only(
      //               left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
      //           shrinkWrap: true,
      //           physics: const NeverScrollableScrollPhysics(),
      //           itemCount: extractData!.length,
      //           itemBuilder: (ctx, index) =>
      //               InkWell(
      //                 onTap: () {
      //                   var check = childCategory![index].id;
      //                   var mainCategoryId = 1;
      //                   var subCategoryId = 1;
      //                   switch (check) {
      //                     case 1:
      //                       {
      //                         checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                         Navigator.of(context).pushNamed(MyRoutes.ASSEMBLEFURNITUREROUTE, arguments: {
      //                           'mainCategoryId' : mainCategoryId,
      //                           'subCategoryId'  : subCategoryId,
      //                           'childCategoryId' : 1,
      //                           'childCategoryTitle': childCategory[index].title,
      //                         });
      //                         print("$check");
      //                       }
      //                       break;
      //                     case 2: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.DISASSEMBLEFURNITURESROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 3: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.CURTAININSTALLATIONROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 4: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.FIXINGSHELVESROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 5: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.HANGTVROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 6: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.SHOWERINSTALLATIONROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 7: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.HANGPICTREROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 8: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.MIRRORINSTALLATIONROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 9: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.FURNITUREREPAIRROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 10: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.SMALLREPAIRROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 11: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.FENCEINSTALLATIONROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 12: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.HOODINSTALLATIONROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 13: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.LANDSCAPINGHOODROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 14: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.ELECTRICALINSTALLATIONROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 15: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.BULBINSTALLATIONROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 16: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.LAMPINSTALLATIONROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 17: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.AUTOMATIONROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 18: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.ACINSTALLATIONROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 19: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.PAINTINGINSTALLATIOROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 20: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.PARQUETINSTALLATIOROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 21: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.TILESINSTALLATIOROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 22: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.CARPETINSTALLATIOROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 23: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.COATWALLROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 24: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.LININGINSTALLATIONROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 25: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.WATERINSTALLATIONROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 26: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.FLUSHINSTALLATIONROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 27: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.FAUCETINSTALLATIONROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 28: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.SINKINSTALLATIONROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 29: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.WASHINGMACHINEROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 30: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.TOILETINSTALLATIONROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                     case 31: {
      //                       checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
      //                       Navigator.of(context).pushNamed(MyRoutes.SINKDRAINROUTE, arguments: {
      //                         'mainCategoryId' : mainCategoryId,
      //                         'subCategoryId'  : subCategoryId,
      //                         'childCategoryId' : childCategory[index].id,
      //                         'childCategoryTitle': childCategory[index].title,
      //                       });
      //                       print("$check");
      //                     }
      //                     break;
      //                   }
      //                 },
      //                 child: ListTile(
      //                   contentPadding: const EdgeInsets.only(
      //                       left: 0.0, bottom: 10.0, top: 10.0, right: 0.0),
      //                   leading: Container(
      //                     width: 60,
      //                     height: 60,
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(10.0),
      //                       // color: Colors.green,
      //                     ),
      //                     child: ClipRRect(
      //                       borderRadius: BorderRadius.circular(10.0),
      //                       child: Image.network(
      //                         '${MyRoutes.IMAGEURL}/${extractData![index].img}',
      //                         fit: BoxFit.cover,
      //                       ),
      //                     ),
      //                   ),
      //                   title: Text(
      //                     extractData[index].title,
      //                     style: Theme.of(context).textTheme.bodyMedium,
      //                   ),
      //                   trailing: const Icon(
      //                     Icons.arrow_forward_ios_outlined,
      //                     size: 20,
      //                   ),
      //                 ),
      //               ),
      //         )
      //             : ListView.builder(
      //           padding: const EdgeInsets.only(
      //               left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
      //           shrinkWrap: true,
      //           physics: const NeverScrollableScrollPhysics(),
      //           itemCount: searchCategoriesData.searchCat!.length,
      //           itemBuilder: (ctx, index) => InkWell(
      //             onTap: () => Navigator.of(context).pushNamed(
      //               MyRoutes.CHILDCATEGORYROUTE,
      //               arguments: {
      //                 'index': index,
      //                 'mainId': extractData![index].id,
      //               },
      //             ),
      //             child: ListTile(
      //               contentPadding: const EdgeInsets.only(
      //                   left: 0.0, bottom: 10.0, top: 10.0, right: 0.0),
      //               leading: Container(
      //                 width: 60,
      //                 height: 60,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(10.0),
      //                   // color: Colors.green,
      //                 ),
      //                 child: ClipRRect(
      //                   borderRadius: BorderRadius.circular(10.0),
      //                   child: Image.network(
      //                     '${MyRoutes.IMAGEURL}/${searchCategoriesData.searchCat![index].img}',
      //                     fit: BoxFit.cover,
      //                   ),
      //                 ),
      //               ),
      //               title: Text(
      //                 searchCategoriesData.searchCat![index].title,
      //                 style: Theme.of(context).textTheme.bodyMedium,
      //               ),
      //               trailing: const Icon(
      //                 Icons.arrow_forward_ios_outlined,
      //                 size: 20,
      //               ),
      //             ),
      //           ),
      //         ),
      //         // Text(mainCategoryData.searchPost![0].title) ,
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
