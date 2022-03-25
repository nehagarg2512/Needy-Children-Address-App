import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:help_needy_children/children_data.dart';
import 'package:maps_launcher/maps_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView.builder(
        itemCount: childrenData.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Card(
                child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    child: Container(
                      color: Colors.grey,
                      child: CachedNetworkImage(
                        imageUrl: childrenData[index]['avatar'].toString(),
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${childrenData[index]['first_name']} ${childrenData[index]['last_name']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      '${childrenData[index]['gender']}',
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 14),
                    ),
                    Text('${childrenData[index]['age']} years')
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    childrenData[index]['behaviour'] == 1
                        ? 'images/devil.png'
                        : childrenData[index]['behaviour'] == 2
                            ? 'images/naughty.png'
                            : childrenData[index]['behaviour'] == 3
                                ? 'images/cool.png'
                                : childrenData[index]['behaviour'] == 4
                                    ? 'images/angle.png'
                                    : 'images/angle.png',
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            )),
            onTap: () {
              var lat =
                  double.parse(childrenData[index]['latitude'].toString());
              var long =
                  double.parse(childrenData[index]['longitude'].toString());
              MapsLauncher.launchCoordinates(
                lat,
                long,
                '${childrenData[index]['first_name']} ${childrenData[index]['last_name']}',
              );
            },
          );
        },
      ),
    ));
  }
}
