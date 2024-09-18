
import 'package:flutter/material.dart';
import 'package:iseng/data.dart';
import 'package:iseng/main.dart';
import 'package:iseng/restaurant.dart';

class FormPage extends StatelessWidget {
  final String title;
  
  FormPage({super.key, required this.title});

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(title),
        // leading: IconButton(  
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        child: Column(
          children: <Widget>[
            TextField(
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nama Restaurant'
              ),
            ),
            ElevatedButton(
              onPressed: () {
                var listRestaurantLength = listRestaurant.length;
                var restaurantLength = (listRestaurantLength + 1);
                var restaurantName = myController.text;
                var restaurant = Restaurant(id : restaurantLength, name: restaurantName);

                listRestaurant.add(restaurant);

                if(listRestaurant.length > listRestaurantLength) {

                  var snackBar = SnackBar(
                    content: Text('Added'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  print(listRestaurant);
                }
              }, 
              child: Text('Simpan')
            )
          ],
        ),
      )
    );
  }
}