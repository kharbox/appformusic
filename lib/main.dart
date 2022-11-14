import 'package:appformusic/Pecter.dart';
import 'package:appformusic/game_true_false.dart/home_app.dart';
import 'package:appformusic/list_drog_drop.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'drag_drop.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    title: "MyApp",
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  final player = AudioPlayer();

  List<String> list = [
    "7liwa_batal_l3alam.mp3",
    "7liwa_da7k.mp3",
    "babel.mp3",
    "l_morphine_dragon.mp3",
  ];
  var inde ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeAppGame()));
          }, icon: const Icon(Icons.gamepad)),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Dropdrag()));
          }, icon: const Icon(Icons.add_box)),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>const Photos()));
          }, icon: const Icon(Icons.pest_control_rodent_outlined)),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ListSiit(),));
          }, icon: const Icon(Icons.access_alarm_rounded))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Container(
        //       padding: const EdgeInsets.all(0),
        //       child: const Text('The Center Music App'),
        //     ),
        //     // ElevatedButton(onPressed: () {
        //     //   player.play(AssetSource("l_morphine_dragon.mp3"));
        //     //   // await player.setSource(AssetSource('assets/babel.mp3'));
        //     // }, child: const Text("play music")),
        //     // ElevatedButton(onPressed: (){
        //     //   player.pause();
        //     // }, child: const Text('stop'))
        //   ],
        // ),
        child: Stack(
          children: 
            [ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: const Text("Name Artist"),
                  trailing: const Icon(Icons.music_note_outlined),
                  focusColor: Colors.red,
                  onTap: (){
                    // player.stop();
                    player.play(AssetSource(list[index]));
                    setState(() {
                      inde = index;
                    });
                  },
                );
              },
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green[100],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: (){
                      player.resume();
                      
                    }, icon: const Icon(Icons.play_arrow)),
                    IconButton(onPressed: (){
                      player.pause();
                    }, icon: const Icon(Icons.stop_outlined)),
                    IconButton(onPressed: (){
                      // player.stop();
                      player.play(AssetSource(list[inde-1]));
                      setState(() {
                        inde--;
                      });
                    }, icon: const Icon(Icons.skip_previous_sharp)),
                    IconButton(onPressed: (){
                      // player.stop();
                      player.play(AssetSource(list[inde+1]));
                      setState(() {
                        inde++;
                      });
                    }, icon: const Icon(Icons.skip_next_rounded))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}