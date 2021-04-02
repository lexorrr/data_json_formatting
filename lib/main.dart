import 'package:data_json_formatting/model/data.dart';
import 'package:data_json_formatting/model/person.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  @override
  Widget build(BuildContext context) {
    final jsonString = '{ "id": 1, "name": "RR" }';
    final decodedMap = jsonDecode(jsonString);
    final user = Person.fromJson(decodedMap);
    final json = jsonEncode(user);

    final jsonArrayString =
        '''[
            { "id": 1, "name": "RR" },
            { "id": 2, "name": "Lala" },
            { "id": 3, "name": "Mendoza" },
            { "id": 4, "name": "Quizora" }
        ]''';

    final jsonNestedJsonArrayString =
    '''{
      "type": "Developers",
      "data": [
            { "id": 1, "name": "RR" },
            { "id": 2, "name": "Lala" },
            { "id": 3, "name": "Mendoza" },
            { "id": 4, "name": "Quizora" }
        ]
    }''';

    List<dynamic> jsonList = jsonDecode(jsonArrayString);
    final List<Person> people = jsonList
          .map((value) => Person.fromJson(value))
          .toList();

    final decodedData = jsonDecode(jsonNestedJsonArrayString);
    final data = Data.fromJson(decodedData);
    final typeFromData = data.type;
    final peopleFromData = data.data;

    print('fromData type: $typeFromData');
    peopleFromData.forEach((person) {
      print('fromData person: ${person.toString()}');
    });

    people.forEach((person) {
      print(person.toString());
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('JSON and XML formatting'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${user.id}'),
            Text('${user.name}'),
            Text('$json')
          ],
        ),
      ),
    );
  }
}

