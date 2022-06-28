import 'package:flutter/material.dart';
import 'package:toggle_theme/themeing/themeing.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _currentTheme = ThemeManger();

  @override
  Widget build(BuildContext context) {
    bool _isdark = _currentTheme.themeMode == ThemeData.dark();

    return MaterialApp(
        theme: _currentTheme.themeMode, //dark or light
        home: Scaffold(
          appBar: AppBar(
            actions: [
              Switch(
                  value: _isdark,
                  onChanged: (value) { 
                    setState(() {                    //main functionality here
                      _currentTheme.toggle(!value);
                    });
                  }),
              const SizedBox(
                width: 40,
              ),
            ],
          ),
          body: const Center(child: ContentsOfPage()),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ));
  }
}

class ContentsOfPage extends StatelessWidget {
  const ContentsOfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        circleAvatarImg(),   //1
        const SizedBox(
          height: 15,
        ),
        textColumn(),        //2
        const SizedBox(
          height: 15,
        ),
        textField1(),        //3
        const SizedBox(
          height: 15,
        ),
        elevatedButton1(),   //4
      ],
    ));
  }

  //child 1
  Widget circleAvatarImg() {
    return CircleAvatar(
        radius: 50,
        backgroundImage: Image.asset('assets/profile_img.jpg').image);
  }

  //child 2
  Widget textColumn() {
    return Column(
      children: const [
        Text('Your Name'),
        SizedBox(
          height: 4,
        ),
        Text('@Username'),
        SizedBox(
          height: 4,
        ),
        Text('Status here.')
      ],
    );
  }

  //child 3
  Widget textField1() {
    return const TextField(
      decoration: InputDecoration(border: OutlineInputBorder()),
    );
  }

  //child 4
  Widget elevatedButton1() {
    return ElevatedButton(onPressed: () {}, child: const Text('Just Click'));
  }
}
