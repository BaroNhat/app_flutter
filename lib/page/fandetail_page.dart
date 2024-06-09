// fan_detail_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class FanDetailPage extends StatefulWidget {
  const FanDetailPage({Key? key}) : super(key: key);

  @override
  _FanDetailPageState createState() => _FanDetailPageState();
}

class _FanDetailPageState extends State<FanDetailPage> {
  int _speed = 3; // Tốc độ mặc định ban đầu

  void _setSpeed(int speed) {
    setState(() {
      _speed = speed;
      // Ở đây, thường bạn sẽ gửi giá trị tốc độ tới bộ điều khiển quạt
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Fan Details'),
        backgroundColor: Colors.grey[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fan Speed',
              style: GoogleFonts.bebasNeue(fontSize: 35),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i <= 4; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _setSpeed(i);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _speed == i ? Color.fromARGB(255, 140, 136, 136) : null,
                      ),
                      child: Text(
                        '$i',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
