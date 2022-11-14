import 'package:appformusic/game_true_false.dart/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'appcontians.dart';
Appcontians appcontians = Appcontians();


class HomeAppGame extends StatefulWidget {
  const HomeAppGame({super.key});

  @override
  State<HomeAppGame> createState() => _HomeAppGameState();
}

class _HomeAppGameState extends State<HomeAppGame> {
  List<Widget> ansresult = [];

  void checkansers(bool anseruserchoice) {
    bool? istrue = appcontians.GetQuestionansw();
    setState(() {
      if (anseruserchoice == istrue) {
        ansresult.add(
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(Icons.thumb_up,color: Colors.green,),
          ),
        );
      } else {
        ansresult.add(
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(Icons.thumb_down,color: Colors.red,),
          ),
        );
      }
      appcontians.tonext();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.voicemail_rounded))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 40,
              child: Row(
                children: ansresult,
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                      height: 450,
                      child:
                          Image.asset('${appcontians.GetQuestionimg()}')),
                  // child: SvgPicture.asset("images/imgsvg/features-5.svg",)),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 50,
                      child: Text(
                        '${appcontians.GetQuestionText()}',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      )),
                ],
              ),
            ),
            // SizedBox(height: 10,),
            Expanded(
              // flex: 1,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          // bool? istrue = thequestions[nubmer].questionanswer;
                          // istrue == true
                          //     ? print('this ansewr is right')
                          //     : print('this aswer is no right');
                          // setState(() {
                          //   nubmer++;
                          // });
                          checkansers(true);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15)),
                        child: const Text(
                          'true',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          checkansers(false);
                          // ansresult.add(
                          //   Icon(Icons.thumb_down),
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15)),
                        child: const Text(
                          'false',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
