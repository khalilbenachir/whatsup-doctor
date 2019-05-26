import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/Profile.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: const Color(0xFF4CB8E2),
        primaryColorDark: const Color(0xFF4CB8E2),
      ),
      home: new DashboardScreen(title: ''),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardScreenState createState() => new _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 10), curve: Curves.linear);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new PageView(
        children: [
          new Home("Patients"),
          new Profile("Doctor"),
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.white,
        ), // sets the inactive color of the `BottomNavigationBar`
        child: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: const Color(0xFF4CB8E2),
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.chat,
                ),
                title: new Text(
                  "Chats",
                )),


            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.person,
                ),
                title: new Text(
                  "Profile",
                )),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }
}
