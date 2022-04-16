import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Animal {
  const Animal(this.species, this.bodyWeight, this.brainWeight);
  final String species;
  final String bodyWeight;
  final String brainWeight;
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Animal> _animalDataChart = const <Animal>[
    Animal("Mountain Beaver", "1.35kg", "8.1g"),
    Animal("Cow", "465kg", "423g"),
    Animal("Grey Wolf", "36.33kg", "119.5g"),
    Animal("Goat", "27.66kg", "115g"),
    Animal("Guinea Pig", "1.04kg", "5.5g"),
    Animal("Diplodocus", "11700kg", "50g"),
    Animal("Asian Elephant", "2547kg", "4603g"),
    Animal("Donkey", "187.1kg", "419g"),
    Animal("Horse", "521kg", "655g"),
    Animal("Potar Monkey", "10kg", "115g"),
    Animal("Cat", "3.3kg", "25.6g"),
    Animal("Gorilla", "207kg", "406g"),
  ];

  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Animal Weight"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.only(bottom: height * 0.34),
            physics: const BouncingScrollPhysics(),
            itemCount: _animalDataChart.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () => setState(() => _selectedItemIndex = index),
              title: Text(_animalDataChart[index].species),
              selected: index == _selectedItemIndex,
              selectedTileColor: const Color(0xFFF0F0F0),
            ),
          ),
          BottomScrollableSheet(animal: _animalDataChart[_selectedItemIndex]),
        ],
      ),
    );
  }
}

class BottomScrollableSheet extends StatelessWidget {
  const BottomScrollableSheet({Key? key, required this.animal})
      : super(key: key);
  final Animal animal;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.20,
      minChildSize: 0.20,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14.0),
              topRight: Radius.circular(14.0),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -5.0),
                blurRadius: 6.0,
                color: Color(0xFFEBEBEB),
              )
            ],
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            children: [
              const Center(
                child: Divider(
                  height: 25.0,
                  endIndent: 160.0,
                  indent: 160.0,
                  thickness: 3.0,
                  color: Color(0xFFC2C2C2),
                ),
              ),
              ListTile(
                title: const Text("Species"),
                subtitle: Text(animal.species),
              ),
              ListTile(
                title: const Text("Body Weight"),
                subtitle: Text(animal.bodyWeight),
              ),
              ListTile(
                title: const Text("Brain Weight"),
                subtitle: Text(animal.brainWeight),
              ),
            ],
          ),
        );
      },
    );
  }
}