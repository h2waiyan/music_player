import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioPlayer audioPlayer = AudioPlayer();
  String url =
      'https://msicoursematerial.s3.us-west-2.amazonaws.com/Coldplay+X+Selena+Gomez+-+Let+Somebody+Go+(Official+Video).mp3';

  bool play_pause = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[300],
        appBar: AppBar(
          title: const Text("My Music Player"),
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: GlassContainer(
                height: 200,
                width: 200,
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.40),
                    Colors.white.withOpacity(0.10),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderGradient: LinearGradient(
                  colors: [
                    Colors.blue.withOpacity(0.60),
                    Colors.blue.withOpacity(0.10),
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.60),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.39, 0.40, 1.0],
                ),
                blur: 20,
                borderRadius: BorderRadius.circular(10.0),
                borderWidth: 1.0,
                elevation: 3.0,
                // shadowColor: Colors.purple.withOpacity(0.20),
                child: const Center(
                    child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Image(
                      height: 200,
                      width: 200,
                      image: NetworkImage(
                          'https://i.scdn.co/image/ab67616d0000b2736fb602bdff70227bdf6c3d7f')),
                )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GlassContainer(
              height: 50,
              width: 50,
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.40),
                  Colors.white.withOpacity(0.10),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderGradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.60),
                  Colors.black.withOpacity(0.10),
                  Colors.blue.withOpacity(0.05),
                  Colors.blue.withOpacity(0.60),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.39, 0.40, 1.0],
              ),
              blur: 20,
              borderRadius: BorderRadius.circular(50.0),
              borderWidth: 1.0,
              elevation: 3.0,
              child: IconButton(
                onPressed: () async {
                  var res;
                  if (play_pause == true) {
                    res = await audioPlayer.play(url);
                  } else {
                    res = await audioPlayer.pause();
                  }
                  if (res == 1) {
                    setState(() {
                      play_pause = !play_pause;
                    });
                  }
                },
                icon: play_pause
                    ? const Icon(Icons.play_arrow)
                    : const Icon(Icons.pause),
              ),
            ),
          ],
        ));
  }
}
