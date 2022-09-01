import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mister_jobby/providers/const_provider/const_provider.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

class GooglePlacesApi extends StatefulWidget {
  const GooglePlacesApi({Key? key}) : super(key: key);

  @override
  State<GooglePlacesApi> createState() => _GooglePlacesApiState();
}

class _GooglePlacesApiState extends State<GooglePlacesApi> {
  TextEditingController searchController = TextEditingController();
  var uuid = Uuid();
  String _sessionToken = '123456';
  List<dynamic> _placesList = [];
  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }

    getSuggestion(searchController.text);
  }

  void getSuggestion(String input) async {
    String kPLACES_API_KEY =
        "AIzaSyAeKxMwTMJzHH2AR1xt7OLWIWFMIzm-JLM&libraries";
    String gBASEURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String requestUrl =
        '$gBASEURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';

    var response = await http.get(Uri.parse(requestUrl));

    if (response.statusCode == 200) {
      setState(() {
        _placesList = jsonDecode(response.body.toString())['predictions'];
      });
    } else {
      throw Exception('failed to load data google api data');
    }
    // print(response.body.toString());
  }

  double longitude = 0.0;
  double latitude = 0.0;
  String address = "";
  @override
  Widget build(BuildContext context) {
    return SearchField(
      controller: searchController,
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
      maxSuggestionsInViewPort: _placesList.length,
      suggestionStyle: Theme.of(context).textTheme.bodySmall,
      suggestions: _placesList.map((e){
        return SearchFieldListItem(
          e['description'],
          item: e,
        );
      }
      ).toList(),
      onSuggestionTap: (p0) async {
        Provider.of<ConstProvider>(context, listen: false).getAddress(address, longitude, latitude);
        List<Location> location = await locationFromAddress(p0.item.toString());
        setState((){
          address = searchController.text;
          latitude = location.last.latitude;
          longitude = location.last.longitude;
        });
        print("\n \n \n \n " );
        print("latitude: ${location.last.latitude}");
        print("longitude: ${location.last.longitude}");
      },
    );
  }
}