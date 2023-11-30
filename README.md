# Screen shot for Flutter


A Flutter package for all platform .


![The example app ](https://github.com/mohammedjmosalam/screenshot_freehand)

## Installation

First, add `screenshot_freehand` as a [dependency in your pubspec.yaml file](https://flutter.dev/using-packages/).


## Example

```dart
import 'package:screenshot_freehand/screenshot_freehand.dart';
import 'package:flutter/material.dart';

void main() => runApp(ScreenShot());

class ScreenShot extends StatefulWidget {
  @override
  _ScreenShotState createState() => _ScreenShotState();
}

class _ScreenShotState extends State<ScreenShot> {
  int _counter = 0;
  Uint8List? imageData;
  late final ScreenShotController screenShotController ;

  @override
  void initState() {
    super.initState();
    screenShotController = ScreenShotController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home:ScreenShot(
      screenShotController: screenShotController,
      child: Scaffold(
        backgroundColor: Colors.amber.shade200,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(
                onPressed: () async {
                  imageData = await screenShotController.takeSnapShot();
                  setState(() {});
                },
                child: const Text("Snap shot"),
              ),
              if (imageData != null)
                Container(
                  width: 400,
                  height: 350,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.green,
                    ),
                    image: DecorationImage(
                      image: MemoryImage(imageData!),
                    ),
                  ),
                ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            setState(() {
                _counter++;
            });
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
    );
  }

 
}
```

