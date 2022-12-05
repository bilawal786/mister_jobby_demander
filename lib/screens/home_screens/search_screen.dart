import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../helpers/routes.dart';
import '../../providers/categories_provider/search_categories_provider.dart';

import '../../widgets/const_widgets/search_input_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final searchData =
        Provider.of<SearchCategoriesProvider>(context, listen: true);
    final extractedSearchData = searchData.searchCat;
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
      body: extractedSearchData == null
          ? Center(
              child: Text(
                "No Search Result found",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
          :
      ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
              itemCount: extractedSearchData.length,
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                        if(extractedSearchData[index].subcategoryId < 5) {
                          var check = extractedSearchData[index].childcategoryId;
                          switch (check) {
                            case 1:
                              {
                                // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                                Navigator.of(context).pushNamed(MyRoutes.ASSEMBLEFURNITUREROUTE, arguments: {
                                  'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                  'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                  'childCategoryId' : extractedSearchData[index].childcategoryId,
                                  'childCategoryTitle': extractedSearchData[index].title,
                                });
                                print("$check");
                              }
                              break;
                            case 2: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.DISASSEMBLEFURNITURESROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 3: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.CURTAININSTALLATIONROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 4: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.FIXINGSHELVESROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 5: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.HANGTVROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 6: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.SHOWERINSTALLATIONROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 7: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.HANGPICTREROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 8: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.MIRRORINSTALLATIONROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 9: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.FURNITUREREPAIRROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 10: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.SMALLREPAIRROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 11: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.FENCEINSTALLATIONROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 12: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.HOODINSTALLATIONROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 13: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.LANDSCAPINGHOODROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 14: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.ELECTRICALINSTALLATIONROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 15: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.BULBINSTALLATIONROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 16: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.LAMPINSTALLATIONROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 17: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.AUTOMATIONROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 18: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.ACINSTALLATIONROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 19: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.PAINTINGINSTALLATIOROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 20: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.PARQUETINSTALLATIOROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 21: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.TILESINSTALLATIOROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 22: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.CARPETINSTALLATIOROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 23: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.COATWALLROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 24: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.LININGINSTALLATIONROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 25: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.WATERINSTALLATIONROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 26: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.FLUSHINSTALLATIONROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 27: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.FAUCETINSTALLATIONROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 28: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.SINKINSTALLATIONROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 29: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.WASHINGMACHINEROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 30: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.TOILETINSTALLATIONROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                            case 31: {
                              // checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
                              Navigator.of(context).pushNamed(MyRoutes.SINKDRAINROUTE, arguments: {
                                'mainCategoryId' : extractedSearchData[index].maincategoryId,
                                'subCategoryId'  : extractedSearchData[index].subcategoryId,
                                'childCategoryId' : extractedSearchData[index].childcategoryId,
                                'childCategoryTitle': extractedSearchData[index].title,
                              });
                              print("$check");
                            }
                            break;
                          }

                        } else {
                          var checkId = extractedSearchData[index].subcategoryId;
                          switch(checkId) {
                            case 5:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.MOWLAWNROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 6:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.HEDGETRIMMINGROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 7:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.CUTTREEROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 8:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.CLEARINGROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 9:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.WEEDINGROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 10:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.MAINTENANCEGREENSPACEROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 11:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.LAWNCAREROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 12:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.TERRACECLEANINGROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 13:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.GARDENINGJOBROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 14:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.MOVINGASSISTANCEROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 15:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.MOVINGFURNITUREROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 16:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.MOVINGAPPLIANCESROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 17:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.RIDCLUTTERROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 18:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.JOBREMOVALROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 19:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.FURNITUREDELIVERYROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 20:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.APPLIANCEDELIVERYROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 21:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.LETTERSDELIVERYROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 22:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.RACEDELIVERYROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 23:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.HOMECLEANINGROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 24:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.IRONINGROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 25:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.CARWASHROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 26:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.POOLWASHINGROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 27:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.WINDOWCLEANINGROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 28:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.CLEANINGJOBROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 29:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.CHILDCAREROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 30:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.DOGSITTERROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 31:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.KEEPCATROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 32:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.KEEPANIMALSROUTE , arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 33:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.CLEANCOMPUTERROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 34:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.COMPUTERCOURSESROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 35:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.INSTALLPRINTERROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 36:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.COMPUTERJOBROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 37:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.HOMECAREROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 38:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.MEDICINEDELIVERYROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 39:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.DELIVERGROCERIESROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 40:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.HOMEDELIVERYROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 41:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.ACCOMPANIMENTRACEROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 42:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.ACCOMPANIMENTMEDICALAPPOINTMENTROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 43:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.PREPAREMEALROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 44:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.WAITERWAITRESSROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 45:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.SEWINGALTERATIONROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 46:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 47:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 48:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 49:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 50:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 51:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 52:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 53:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 54:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 55:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 56:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 57:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 58:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 59:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 60:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 61:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.PHOTOGRAPHYROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 62:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.HOMECHEFROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 63:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.BARTENDERROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 64:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.WAITERROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 65:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.DJROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 66:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.ANIMATORROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 67:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.FLYERSDISTRIBUTIONROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 68:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.HOSTHOTESSROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 69:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.ADMINISTRAVTIVETASKROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 70:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.VEHICLEMAINTENANCEROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 71:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.VEHICLEREPAIRROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 72:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.TROUBLESHOOTINGROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                            case 73:
                              {
                                // prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE):
                                Navigator.of(context).pushNamed(MyRoutes.EQUIPMENTRENTALSCREENROUTE, arguments: {
                                  'mainCategoryId': extractedSearchData[index].maincategoryId,
                                  'subCategoryId': extractedSearchData[index].subcategoryId,
                                  'subCategoryTitle': extractedSearchData[index].title,
                                });
                              }
                              break;
                          }
                        }
                    },
                    leading:Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        // color: Colors.green,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          '${MyRoutes.IMAGEURL}/${extractedSearchData[index].image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      extractedSearchData[index].title,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                    ),

                  ),
                  const Divider()
                ],
              ),),
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
