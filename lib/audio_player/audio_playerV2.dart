import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerV2 extends StatefulWidget {
  const AudioPlayerV2({super.key});

@override
  State<AudioPlayerV2> createState() => _AudioPlayerV2State();
}

class _AudioPlayerV2State extends State<AudioPlayerV2> {
  
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    double imgHeight = size.height * .4;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 22, 61),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                const Text("Recently Played",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: size.width,
              height: imgHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,         
                ),
                image: const DecorationImage(
                  image: AssetImage("assets/img/ado.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: size.width,
              child: songInfo(),
            ),
            const SizedBox(height: 15),
            audioControls(size),
            const SizedBox(height: 15),
            lyricInfo(),
          ],
        ),
      ),
    );
  }

songInfo() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Usseewa",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(
            Icons.favorite_border,
            color: Colors.white,
            ),
        ],
      ),
      Text(
      "Ado",
      style: TextStyle(
        color: Colors.white60,
        fontSize: 14,
        ),
      ),
    ],
  );
}

audioControls(Size size) {
    double percentage = size.width * .47;

    timeSlider() {
      return SizedBox(
        width: size.width,
        height: 10,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Container(
              width: size.width,
              height: 4,
              color: Colors.white,
            ),
            Container(
              width: percentage,
              height: 4,
              color: const Color(0xFF643CEB),
            ),
            Positioned(
              left: percentage,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFF643CEB),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Column(
          children: [
            timeSlider(),
            //Minutos
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "0:30",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "-2:48",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        //Controles
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.shuffle,
              color: Colors.white,
              size: 28,
            ),
            IconButton(
              onPressed: () {
                player.stop();
              },
              icon: const Icon(
                Icons.skip_previous_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xFF643CEB),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () async {
                  player.setAsset('assets/mp3/testaudio.mp3');
                  player.play();
                },
                icon: const Icon(
                  Icons.pause,
                  color: Colors.white,
                ),
              ),
            ),
            const Icon(
              Icons.skip_next_rounded,
              color: Colors.white,
              size: 28,
            ),
            const Icon(
              Icons.repeat,
              color: Colors.white,
              size: 28,
            ),
          ],
        ),
      ],
    );
  }
}


lyricInfo() {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF302F42),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: ListView(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Lyrics",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.open_in_new_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 12),
                  Icon(
                    Icons.open_in_full_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "正しさとは 愚かさとは",
            style: TextStyle(color: Colors.grey[400]),
          ),
          const Text(
            "それが何か見せつけてやる",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "ちっちゃな頃から優等生",
            style: TextStyle(color: Colors.grey[400]),
          ),
          Text(
            "気づいたら大人になっていた",
            style: TextStyle(color: Colors.grey[400]),
          ),
        ],
      ),
    ),
  );
}



// Azul (fondo)   : 13122B
// Morado / lila  : 643CEB
// gris (lyric)   : 302F42


