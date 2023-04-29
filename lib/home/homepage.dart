import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
//mport 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List notes = [
    {"note": "Study"},
    {"note": "travel"},
    {"note": "holiday"},
    {"note": "frinds"},
    {"note": "work"},
  ];

  
   
  var username;  var password;

    getp()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
   setState(() {
     username= prefs.getString('name');
     password= prefs.getString('password');

   });
    print(username);
        print(password);
  }

  @override
  Widget build(BuildContext context) {
    double md = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text('homepage'),
        
      ),
                drawerScrimColor: Color.fromARGB(255, 212, 194, 167).withOpacity(0.6),

       drawer: Drawer(
          child: Container(
              padding: EdgeInsets.only(top: 45),
              height: 20,
              color: Colors.grey[200],
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(
                        child: Icon(Icons.person),
                        radius: 50,
                        backgroundColor: Colors. purple,
                      ),
                      accountName: Text('aya sh'),
                      accountEmail: Text('aya@gmail.com')),
                  ListTile(
                    title: Text('Settings and privacy:'),
                    leading: Icon(Icons.settings),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Help and suport:'),
                    leading: Icon(Icons.help),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('about us:'),
                    leading: Icon(Icons.phone),
                    onTap: () {},
                  )
                ],
              )),
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[400],
        // ignore: prefer_const_constructors
        child: Icon(Icons.add),

        onPressed: ()  {
         Navigator.of(context).pushNamed('addnote');
        },
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, i) {
              return ListNote(
                md: md,
                notes: notes[i],
              );
            }),
      ),
    );
  }
}

class ListNote extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final notes;
  final md;
  ListNote({this.notes, this.md});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(flex: 1, child: Image.asset('images/nn.png')),
          Expanded(
            flex: 6,
            child: ListTile(
              trailing: IconButton(
                onPressed: () {},
                // ignore: prefer_const_constructors
                icon: Icon(
                  Icons.edit,
                  // ignore: prefer_const_constructors
                  color: Colors.purple,
                ),
              ),
              title: Text("${notes["note"]}"),
            ),
          ),
        ],
      ),
    );
  }
}
//يطبع الاحداثيات
         // cl = await getLat();
          //print(cl.latitude);
          //print(cl.longitude);
          //يطبع المكان
          //List<Placemark> placemarks = await placemarkFromCoordinates(
           // cl.latitude,
            //cl.longitude,
         // );
         // print(placemarks[0].street);
          //حساب مسافة 
          //print(Geolocator.distanceBetween(
            //  33.493773, 36.240746, 33.497517, 36.303504));