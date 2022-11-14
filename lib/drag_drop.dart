import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Dropdrag extends StatefulWidget {
  const Dropdrag({super.key});

  @override
  State<Dropdrag> createState() => _DropdragState();
}

class _DropdragState extends State<Dropdrag> {
  Color coldratar = Colors.black;


  @override
  Widget build(BuildContext context) {
  final showstatus = coldratar == Colors.black;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DragTarget<Color>(
              onAccept: (data) {
                setState(() {
                  coldratar = data;
                });
              },
              builder: (context, candidateData, rejectedData) => Container(
                color: coldratar,
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(height: 200,),
            IgnorePointer(
              ignoring: !showstatus,
              child: Opacity(
                opacity: showstatus ? 1 : 0,
                child: Draggable<Color>(
                  data: Colors.red,
                  child: Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                  feedback: Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                  ),
                  childWhenDragging: Container(
                    color: Colors.green,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}