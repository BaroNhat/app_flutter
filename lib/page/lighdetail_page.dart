// lib/light_detail_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LightDetailPage extends StatefulWidget {
  const LightDetailPage({super.key});

  @override
  _LightDetailPageState createState() => _LightDetailPageState();
}

class _LightDetailPageState extends State<LightDetailPage> {
  double _brightness = 128; // Initial brightness value

  void _updateBrightness(double value) {
    setState(() {
      _brightness = value;
      // Here, you would typically send the brightness value to the LED controller
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Light Details'),
        backgroundColor: Colors.grey[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Adjust LIGHT Brightness',
              style: GoogleFonts.bebasNeue(fontSize: 35),
            ),
            SizedBox(height: 40),
            Slider(
              value: _brightness,
              min: 0,
              max: 255,
              divisions: 255,
              label: _brightness.round().toString(),
              onChanged: _updateBrightness,
            ),
            SizedBox(height: 20),
            Text(
              'Brightness: ${_brightness.round()}',
              style: GoogleFonts.bebasNeue(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
