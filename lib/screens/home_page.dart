import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registro/generated/l10n.dart';
import 'package:registro/screens/service_full_screen.dart';
import 'package:registro/widget/bottom_nav_bar.dart';
import "package:http/http.dart" as http;
import 'package:registro/widget/service_card.dart';
import '../util/navegate.dart';

import '../platform_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //This is going to give us total height and width our device
    var size = MediaQuery.of(context).size;
    var uri = getUri();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff885566),
        // leading: IconButton(
        //     onPressed: () {}, icon: Image.asset("assets/icons/logo.jpeg")),
        title: IconButton(
            onPressed: () {}, icon: Image.asset("assets/icons/logo.jpeg")),
        centerTitle: true,

        // actions: [
        //   IconButton(
        //       onPressed: () {}, icon: Image.asset("assets/icons/logo.jpeg"))
        // ],
      ),
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Toni Oller',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          accountEmail:
              Text('tonieetac@gmail.com', style: TextStyle(fontSize: 18)),
          currentAccountPicture:
              CircleAvatar(backgroundImage: AssetImage("assets/logo.png")),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text(S.current.chat, style: TextStyle(fontSize: 20)),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.room),
          title: Text(S.current.maps, style: TextStyle(fontSize: 20)),
          onTap: () {
            Navegate.goToMapa(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.room),
          title: Text(S.current.report, style: TextStyle(fontSize: 20)),
          onTap: () {},
        ),
      ])),
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
              //Here the height of the container is 45% of our total height
              height: size.height * .35,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFFFFA50E), Color(0xFFF260D2B)]),
              )),
          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  //padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        S.current.time,
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(fontWeight: FontWeight.w300),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        //height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              CupertinoIcons.search_circle,
                              size: 30.0,
                            ),
                            suffixIcon: Icon(
                              Icons.tune,
                              size: 22.0,
                            ),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: 15.0,
                            ),
                            hintText: S.current.search,
                          ),
                        ),
                      ),
                      Expanded(
                          child: FutureBuilder<http.Response>(
                        future: http.get(Uri.parse('$uri/services')),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            final String result = snapshot.data!.body;
                            //decode the response to a json map and get the results array
                            print(result);
                            final List services = jsonDecode(result);
                            return _buildCards(context, services);
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      )),
                    ],
                  )))
        ],
      ),
    );
  }
}

ListView _buildCards(BuildContext context, List services) {
  return ListView.builder(
      itemCount: services.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        String description = services[index]['description'];
        String img = services[index]['img_url'];
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ServiceFullScreen(
                        description: description,
                        img: img,
                      ))),
          child: ServiceCard(description: description, imgUrl: img),
        );
      });
}
