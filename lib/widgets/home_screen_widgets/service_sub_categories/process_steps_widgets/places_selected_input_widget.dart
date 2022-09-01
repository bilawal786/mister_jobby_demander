import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';
import 'package:geocoding/geocoding.dart';

import '../../../../providers/const_provider/const_provider.dart';

class GooglePlacesApi extends StatefulWidget {
  final TextEditingController controller;
  final List suggestion;

  const GooglePlacesApi({Key? key, required this.controller, required this.suggestion}) : super(key: key);

  @override
  State<GooglePlacesApi> createState() => _GooglePlacesApiState();
}

class _GooglePlacesApiState extends State<GooglePlacesApi> {




  @override
  Widget build(BuildContext context) {
    return SearchField(
      controller: widget.controller,
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
      maxSuggestionsInViewPort: widget.suggestion.length,
      suggestionStyle: Theme.of(context).textTheme.bodySmall,
      suggestions: widget.suggestion.map((e){
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