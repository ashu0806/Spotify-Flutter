import 'package:flutter/material.dart';
import 'package:flutter_advanced_seekbar/flutter_advanced_seekbar.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:spotify/model/model.dart';
import 'package:spotify/songdata/songdata.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double slidervalue = 0.0;

  FlutterSoundPlayer? audioplay;

  Future play(VoidCallback whenfinished) async {
    await audioplay!.startPlayer(
        fromURI: 'assets/songs/Eye_Candy.mp3', whenFinished: whenfinished);
  }

  Future stop() async {
    await audioplay!.stopPlayer();
  }

  Future togglePlayer({required VoidCallback whenfinished}) async {
    if (audioplay!.isPlaying) {
      await stop();
    } else {
      await play(whenfinished);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xff051172),
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            // DrawerHeader(
            //   child: Text("Hi This is a drawer"),
            //   decoration: BoxDecoration(color: Colors.purple),
            // )
            UserAccountsDrawerHeader(
              accountName: Text(
                "Ashwini Gupta",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                "demo@gmail.com",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.bold),
              ),
              // currentAccountPicture:Image.network("https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                "Account",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "Personal",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.white,
              ),
              title: Text(
                "Email",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "demo@gmail.com",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.save,
                color: Colors.white,
              ),
              title: Text(
                "Saved Email",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.drafts,
                color: Colors.white,
              ),
              title: Text(
                "Drafts",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "Emails saved in drafts",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("Spotify"),
            const SizedBox(
              width: 15,
            ),
            const Text("Home"),
            const SizedBox(
              width: 15,
            ),
            const Text("About"),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 618,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bodybg.png"),
                    fit: BoxFit.cover)),
            child: Center(
              child: Container(
                height: 600,
                width: 1000,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg.png"),
                        fit: BoxFit.cover)),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Listen to your favourite songs",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                itemBuilder: ((context, index) {
                                  Songs items = songInfo[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SongContainer(
                                      // playSong: ,
                                      songCover: items.image,
                                      songName: items.name,
                                    ),
                                  );
                                }),
                                itemCount: 14,
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 40),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              // Text(
                              //   "Now Playing",
                              //   style: TextStyle(
                              //     fontSize: 25,
                              //     fontWeight: FontWeight.bold,
                              //     color: Colors.lightBlueAccent,
                              //   ),
                              // ),
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 90,
            color: const Color.fromARGB(255, 26, 35, 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: AdvancedSeekBar(
                    Colors.white,
                    15,
                    Colors.blue,
                    lineHeight: 8,
                    scaleWhileDrag: true,
                    fillProgress: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.black))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          mouseCursor: MaterialStateMouseCursor.clickable,
                        ),
                        onPressed: (() {
                          togglePlayer(whenfinished: () {});
                        }),
                        child: const Icon(
                          Icons.skip_previous_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.black))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          mouseCursor: MaterialStateMouseCursor.clickable,
                        ),
                        onPressed: (() {
                          togglePlayer(whenfinished: () {});
                        }),
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.black))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          mouseCursor: MaterialStateMouseCursor.clickable,
                        ),
                        onPressed: (() {
                          togglePlayer(whenfinished: () {});
                        }),
                        child: const Icon(
                          Icons.skip_next_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SongContainer extends StatelessWidget {
  const SongContainer({
    Key? key,
    required this.songCover,
    required this.songName,
    // required this.playSong,
  }) : super(key: key);
  final String songCover;
  final String songName;
  // final String playSong;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 400,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(
              4.0,
              4.0,
            ),
            blurRadius: 3.0,
            spreadRadius: 3.0,
          )
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(songCover), fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
        ),
        const SizedBox(
          width: 65,
        ),
        Text(
          songName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Text(
            "03:45",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          ),
        ),
        const Icon(
          Icons.play_arrow_rounded,
          size: 40,
          color: Colors.black,
        )
      ]),
    );
  }
}
