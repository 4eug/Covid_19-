import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:country_picker/country_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 50,
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  'assets/background.png',
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height / 1.5,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: Text(
                      'COVID -19 UPDATE',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                      child: Text(
                    'Check Current Updates',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Color.fromRGBO(37, 112, 252, 1),
                        fontWeight: FontWeight.w600),
                  )),
                  SizedBox(height: MediaQuery.of(context).size.height / 50),
                  Center(
                    child: AvatarGlow(
                      glowColor: Color.fromRGBO(37, 112, 252, 1),
                      endRadius: 200.0,
                      duration: Duration(milliseconds: 2000),
                      showTwoGlows: true,
                      repeatPauseDuration: Duration(microseconds: 100),
                      shape: BoxShape.circle,
                      child: Material(
                        elevation: 2,
                        shape: CircleBorder(),
                        color: Color.fromRGBO(37, 112, 252, 1),
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 100,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Get Updates',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton.icon(
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: MediaQuery.of(context).size.width / 4.5),
                    color: Color.fromRGBO(37, 112, 252, 1),
                    onPressed: () {
                      showCountryPicker(
                          context: context,
                          showPhoneCode: true,
                          onSelect: (Country country) {
                            print('Select country: ${country.displayName}');
                          });
                    },
                    label: Text('Select Country'),
                    icon: Icon(Icons.arrow_circle_down),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
