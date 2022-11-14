import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListSiit extends StatefulWidget {
  const ListSiit({super.key});

  @override
  State<ListSiit> createState() => _ListSiitState();
}

class _ListSiitState extends State<ListSiit> {
  final item = ['item1', 'item2', 'item3','item4','item5','item6','item7'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ReorderableListView.builder(
          onReorder: (oldIndex, newIndex) {
            if(newIndex > oldIndex ) newIndex--;
            final itemflg = item.removeAt(oldIndex);
            item.insert(newIndex, itemflg);
          },
          itemCount: item.length,
          itemBuilder: (context, index) {
            return ListTile(
              key: ValueKey(index),
              title: Text('the name ${item[index]}'),
              subtitle: const Text('the name of tis personne'),
              trailing: const Icon(Icons.people_rounded),
            );
          }, 
        ),
      )
    );
  }
}