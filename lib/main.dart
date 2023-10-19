import 'package:flutter/material.dart';

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatefulWidget {
  const TabBarExample({Key? key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Handle search button press
            },
          ),
          PopupMenuButton<String>(
            color: Colors.white,
            onSelected: (value) {
              // Handle menu item click
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'Settings',
                  child: Text('Settings'),
                ),
                PopupMenuItem<String>(
                  value: 'Help',
                  child: Text('Help'),
                ),
                PopupMenuItem<String>(
                  value: 'Logout',
                  child: Text('Logout'),
                ),
              ];
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          tabs: const <Widget>[
            Tab(
              text: "Chats",
            ),
            Tab(
              text: "Status",
            ),
            Tab(
              text: "Calls",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ListView(
            children: <Widget>[
              getchek("https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg", "kehan", "when will you come", Colors.black26, "10:55"),
              getchek("https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg", "arman", "hello, how are you", Colors.black26, "10:55"),
              getchek("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg", "ammu", "hey..................", Colors.black12,"04:43 AM"),
              getchek("https://media.istockphoto.com/id/1017117062/photo/father-walking-with-is-son-at-the-park-at-sunset.jpg?s=1024x1024&w=is&k=20&c=Z2eQs7vt0eyhQwElGkp0ieKrztgp_QCVfi0Z4neWKmk=","kashi","kb ao ge",Colors.white24,"10:23 PM"),
              getchek("https://example.com/yet_another_image.jpg", "Alice", "I'm good, thank you!", Colors.orange,"02:30 AM"),
              getchek("https://example.com/another_image.jpg", "John", "How are you?", Colors.blue,"03:15 PM"),



            ],
          ),
          ListView(
            children: <Widget>[
              getstatus("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg", "ammu","7 min ago"),
              getstatus("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg", "ammu","8 min ago"),
               getstatus("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg", "ammu","8 min ago"),
            ]
          ),
          ListView(
            children: <Widget>[
              getCalls("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg", "ammu","8 min ago",Colors.green ),
              getCalls("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg", "kashif","1 min ago",Colors.red ),
              getCalls("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg", "ammu","2 day  ago",Colors.green ),
              getCalls("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg", "fahad","2 day ago",Colors.red ),
              getCalls("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg", "ammu","8 min ago",Colors.green ),
              getCalls("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg", "ammu","3 days ago",Colors.green ),
            ]
          ),
        ],
      ),
    );
  }
}

Widget getchek(String url, String tittle, String subtittle, Color bgcolor, String trailing) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: NetworkImage(url),
      backgroundColor: bgcolor,
    ),
    title: Text(tittle),
    subtitle: Text(subtittle),
    trailing: Text(trailing),
  );
}

Widget getstatus(String url, String tittle, String subtittle,) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: NetworkImage(url),
      // backgroundColor: bgcolor,
    ),
    title: Text(tittle),
    subtitle: Text(subtittle),
    // trailing: Text(trailing),
  );
}
Widget getCalls(String url, String tittle, String subtittle,CallIcon) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: NetworkImage(url),
      // backgroundColor: bgcolor,
    ),
    title: Text(tittle),
    subtitle: Text(subtittle),
    trailing: Icon(
      Icons.phone,
      color: CallIcon,
    ),
  );
}
