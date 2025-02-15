import 'package:flutter/material.dart';
import 'package:flutter_bug_logger/console_overlay.dart';
import 'package:flutter_bug_logger/flutter_logger.dart';

void main() {
  Logger.init(
    true,
    isShowFile: false,
    isShowTime: false,
    isShowNavigation: true,
    levelVerbose: 247,
    levelDebug: 26,
    levelInfo: 28,
    levelWarn: 3,
    levelError: 9,
    phoneVerbose: Colors.white54,
    phoneDebug: Colors.blue,
    phoneInfo: Colors.green,
    phoneWarn: Colors.yellow,
    phoneError: Colors.redAccent,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void onPressed() {
    Logger.v("hello world\nsecond ");
    Logger.d("hello world\nsecond time");
    Logger.i("hello world\nsecond time");
    Logger.w("hello world\nsecond time");
    Logger.e("hello world\nsecond time", tag: "TAG");
    var json = "{\"name\":\"tom\",\"age\":\"38\",\"son\":{\"name\":\"jerry\",\"age\":\"18\",\"grandson\":{\"name\":\"lily\",\"age\":\"8\"}}}";
    Logger.json(json);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Logger"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: onPressed,
          child: Icon(Icons.add),
        ),
        body: Demo(),
      ),
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  void initState() {
    super.initState();
    // 打开 ConsoleOverlay
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      ConsoleOverlay.show(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
