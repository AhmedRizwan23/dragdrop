import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DragAndDropDemo(),
    );
  }
}

class DragAndDropDemo extends StatefulWidget {
  const DragAndDropDemo({super.key});

  @override
  _DragAndDropDemoState createState() => _DragAndDropDemoState();
}

class _DragAndDropDemoState extends State<DragAndDropDemo> {
  late Widget yellowRow;
  late Widget greenRow;

  @override
  void initState() {
    super.initState();
    yellowRow = buildDraggableRow();
    greenRow = buildDragTargetRow();
  }

  Widget buildDraggableRow() {
    return Draggable<String>(
      data: 'Dragged Row',
      feedback: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.amber[800],
            child: const Text("Draggable"),
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.amber[800],
            child: const Text("Draggable"),
          ),
          // Add more containers or widgets as needed
        ],
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.amber,
            child: const Text("Draggable"),
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.amber,
            child: const Text("Draggable"),
          ),
          // Add more containers or widgets as needed
        ],
      ),
    );
  }

  Widget buildDragTargetRow() {
    return DragTarget<String>(
      onAcceptWithDetails: (details) {
        setState(() {
          // Swap the positions of yellow and green rows
          Widget temp = yellowRow;
          yellowRow = greenRow;
          greenRow = temp;
        });
      },
      builder: (context, candidateData, rejectedData) => Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.green,
            child: const Text("Droppable"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag and Drop Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            yellowRow,
            greenRow,
          ],
        ),
      ),
    );
  }
}
