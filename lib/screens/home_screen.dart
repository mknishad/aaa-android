import 'package:aaa/screens/report_details_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    //Text('Home Screen', style: TextStyle(fontSize: 24)),
    ReportList(),
    Text('Search Screen', style: TextStyle(fontSize: 24)),
    Text('Profile Screen', style: TextStyle(fontSize: 24)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AAA'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ReportList extends StatelessWidget {
  const ReportList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ReportDetailsScreen(), // Replace with your second screen
                  ),
                );
              },
              splashColor: Colors.grey[300],
              splashFactory: InkRipple.splashFactory,
              child: ListTile(
                title: Text('Patient ID: ${index + 8029643657160423794}'),
                subtitle: const Row(
                  children: [
                    Text('Age: 54'),
                    SizedBox(width: 16.0),
                    Text('Gender: Male'),
                  ],
                ),
                trailing: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 154, 43, 16),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  //color: Colors.deepOrange,
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      'AAA',
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
