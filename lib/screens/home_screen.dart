import 'package:flutter/material.dart';
import '../models/place_model.dart';
import '../services/api_service.dart';
import '../widgets/place_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  List<Place> places = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchPlaces();
  }

  Future<void> fetchPlaces() async {
    setState(() => isLoading = true);
    try {
      final fetchedPlaces = await _apiService.fetchPlaces();
      setState(() {
        places = fetchedPlaces;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : Column(
                  children: [
                    Container(
                      color: Colors.purple,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text('Hi Guy!', style: TextStyle(color: Colors.white, fontSize: 24)),
                          Text('Where are you going next?', style: TextStyle(color: Colors.white)),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Search your destination',
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: () {}, child: Text('Hotels')),
                        ElevatedButton(onPressed: () {}, child: Text('Flights')),
                        ElevatedButton(onPressed: () {}, child: Text('All')),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Popular Destinations', style: TextStyle(fontSize: 18)),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: places.length,
                        itemBuilder: (context, index) {
                          return PlaceCard(place: places[index]);
                        },
                      ),
                    ),
                  ],
                ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}