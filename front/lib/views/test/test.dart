/* import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:audioplayers/audioplayers.dart';
import "package:cached_network_image/cached_network_image.dart";
import 'package:front/config/app_api.dart';
import 'package:web_socket_channel/io.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final channel = IOWebSocketChannel.connect('ws://localhost:3000');

  var userInput;
  List messages = [];
  send2WebSocket() {
    channel.sink.add(userInput);
  }

  AudioPlayer audioPlayer = new AudioPlayer();

  Duration duration = new Duration();

  Duration position = new Duration();

  bool isPlaying = false;

  bool isLoading = false;

  bool isPause = false;

  @override
  Widget build(BuildContext context) {
    final now = new DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text("text"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                /*       BubbleNormalImage(
                  id: 'id001',
                  image: _image(),
                  color: Colors.purpleAccent,
                  tail: true,
                  delivered: true,
                ),
              BubbleNormalAudio(
                  color: Color(0xFFE8E8EE),
                  duration: duration.inSeconds.toDouble(),
                  position: position.inSeconds.toDouble(),
                  isPlaying: isPlaying,
                  isLoading: isLoading,
                  isPause: isPause,
                  onSeekChanged: _changeSeek,
                  onPlayPauseButtonClick: _playAudio,
                  sent: true,
                ),              
             */
                DateChip(
                  date: new DateTime(now.year, now.month, now.day - 2),
                ),
                DateChip(
                  date: new DateTime(now.year, now.month, now.day - 1),
                ),
                DateChip(
                  date: now,
                ),
                BubbleSpecialThree(
                  text:
                      'bubble special three wible special three wible special three wible special three wible special three wible special three with tail',
                  color: Color(0xFF1B97F3),
                  tail: true,
                  textStyle: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
          MessageBar(
            onSend: (_) => print(_),
            actions: [
              InkWell(
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 24,
                ),
                onTap: () {},
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: InkWell(
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.green,
                    size: 24,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  /* Widget _image() {
    return Container(
      constraints: BoxConstraints(
        minHeight: 20.0,
        minWidth: 20.0,
      ),
      child: CachedNetworkImage(
        imageUrl: 'https://i.ibb.co/JCyT1kT/Asset-1.png',
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
 */

  /* void _changeSeek(double value) {
    setState(() {
      audioPlayer.seek(new Duration(seconds: value.toInt()));
    });
  } */

  /*  void _playAudio() async {
    final url =
        'https://file-examples.com/storage/fef1706276640fa2f99a5a4/2017/11/file_example_MP3_700KB.mp3';
    if (isPause) {
      await audioPlayer.resume();
      setState(() {
        isPlaying = true;
        isPause = false;
      });
    } else if (isPlaying) {
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
        isPause = true;
      });
    } else {
      setState(() {
        isLoading = true;
      });
      await audioPlayer.play(UrlSource(url));
      setState(() {
        isPlaying = true;
      });
    }

    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
        isLoading = false;
      });
    });
    audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
      });
    });
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        duration = new Duration();
        position = new Duration();
      });
    });
  }
   */
}
 */