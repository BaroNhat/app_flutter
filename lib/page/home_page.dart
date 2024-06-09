import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_flutter/util/smart_device_box.dart';
import 'changepw_page.dart';
import 'login_page.dart';
import 'lighdetail_page.dart';
import 'fandetail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus, detailPage ]
    ["Light", "lib/icons/light-bulb.png", false, LightDetailPage()],
    ["Venti", "lib/icons/ventilation.png", false, LightDetailPage()],
    ["TV", "lib/icons/smart-tv.png", false, LightDetailPage()],
    ["Fan", "lib/icons/fan.png", false, FanDetailPage()],
  ];

  // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  void showDeviceNotAvailableDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[300],
          title: Text("NOTHING TO ADJUST !"),
          content: Text("This device detail is not available."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child:
                  Text('Bao Nhat', style: GoogleFonts.bebasNeue(fontSize: 50)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Change password'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
              onTap: () {
                Navigator.pop(context); // Close the drawer first
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false, // Remove all previous routes
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // welcome home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home,",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  ),
                  Text(
                    'Bao Nhat',
                    style: GoogleFonts.bebasNeue(fontSize: 50),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 204, 204, 204),
              ),
            ),

            const SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Biểu tượng nhiệt độ
                  Row(
                    children: [
                      Image.asset(
                        'lib/icons/temparature.png',
                        height: 40,
                        color: Colors.grey.shade800,
                      ),
                      const SizedBox(
                          width: 8), // Khoảng cách giữa biểu tượng và giá trị
                      Text(
                        '24°C', // Bạn có thể thay thế giá trị này bằng dữ liệu thực
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 40), // Khoảng cách giữa hai biểu tượng

                  // Biểu tượng độ ẩm
                  Row(
                    children: [
                      Image.asset(
                        'lib/icons/moisturizing.png',
                        height: 40,
                        color: Colors.grey.shade800,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '60%',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            // smart devices grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                "Smart Devices",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // grid
            Expanded(
              child: GridView.builder(
                itemCount: mySmartDevices.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 1 || index == 2) {
                        showDeviceNotAvailableDialog(context);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => mySmartDevices[index][3]),
                        );
                      }
                    },
                    child: SmartDeviceBox(
                      smartDeviceName: mySmartDevices[index][0],
                      iconPath: mySmartDevices[index][1],
                      powerOn: mySmartDevices[index][2],
                      onChanged: (value) => powerSwitchChanged(value, index),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
