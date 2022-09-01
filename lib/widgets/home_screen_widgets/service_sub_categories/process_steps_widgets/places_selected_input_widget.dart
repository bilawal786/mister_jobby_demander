import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';
import 'package:geocoding/geocoding.dart';

import '../../../../providers/const_provider/const_provider.dart';

class GooglePlacesApi extends StatefulWidget {
  const GooglePlacesApi({Key? key}) : super(key: key);

  @override
  State<GooglePlacesApi> createState() => _GooglePlacesApiState();
}

class _GooglePlacesApiState extends State<GooglePlacesApi> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final search = Provider.of<ConstProvider>(context).searchPlaceController;
    search.addListener(() {
      Provider.of<ConstProvider>(context).onChangePlace();
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   final search = Provider.of<ConstProvider>(context).searchPlaceController;
  //   search.addListener(() {
  //     Provider.of<ConstProvider>(context).onChangePlace();
  //   });
  //   // searchController.addListener(() {
  //   //   onChange();
  //   // });
  // }



  @override
  Widget build(BuildContext context) {
    final searchPlacesFieldData = Provider.of<ConstProvider>(context);
    return SearchField(
      controller: searchPlacesFieldData.searchPlaceController,
      hint: 'Find Address',
      searchStyle: Theme.of(context).textTheme.bodySmall,
      searchInputDecoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500, width: 1),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      itemHeight: MediaQuery.of(context).size.width / 10 ,
      maxSuggestionsInViewPort: searchPlacesFieldData.placesList.length,
      suggestionStyle: Theme.of(context).textTheme.bodySmall,
      suggestions: searchPlacesFieldData.placesList.map((e){
        return SearchFieldListItem(
          e['description'],
          item: e,
        );
      }
      ).toList(),
      onSuggestionTap: (p0) async {
        List<Location> location = await locationFromAddress(p0.item.toString());
        print("\n \n \n \n " );
        print("latitude: ${location.last.latitude}");
        print("longitude: ${location.last.longitude}");
      },
    );
  }
}