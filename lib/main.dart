import 'package:flutter/material.dart';
import 'package:iseng/data.dart';
import 'package:iseng/restaurant.dart';
import 'package:iseng/form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Flutter'),
      home: _MyHomePage(title: 'List')
    );
  }
}

class _MyHomePage extends StatefulWidget {
  final String title;
  
  _MyHomePage({super.key, required this.title});

  @override
  State<_MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  final myController = TextEditingController();

  void loadState(Restaurant restaurant) 
  {
    setState(() {
      listRestaurant.add(restaurant);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(widget.title),
      ),
      body: Column(  
        children: [
          ElevatedButton(
            onPressed: () {
              // Define your button action here
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  FormPage(title: 'Form'))
              );
            },
            child: Text('Ke Form'),
          ),
          Expanded(  
            child: ListView.builder(
              itemCount: listRestaurant.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.amber,
                  child: Center(
                    child: Text(listRestaurant[index].name)
                  )
                );
              }
            )
          )
        ]
      )
    );
  }
}

