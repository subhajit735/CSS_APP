// ignore: avoid_web_libraries_in_flutter

import 'package:cssapp/screens/home_screen/pages/EventsPage/cards/abacus_cards.dart';
// import 'package:cssapp/screens/home_screen/pages/EventsPage/engima.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/enigma.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/widgets/abacus_text.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/widgets/enigma_text.dart';
import 'package:lottie/lottie.dart';

import 'cards/techno_cards.dart';
import 'cards/cultural_cards.dart';
import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';
import 'widgets/widgets.dart';
import 'abacus.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  bool technoEventsSelected = true;
  bool culturaleventsselected = false;
  bool abacuseventselected = false;
  bool isExpanded = false;
  // bool isselected = false;

  int index = 0;
  int colorindex = 0;
  int boldindex = 1;
  List<dynamic> bold = [FontWeight.bold, FontWeight.normal];
  List<dynamic> color = [
    Pallet.accentColor,
  ];
  List<dynamic> cards = [
    TechnoCards.cards,
    CulturalCards.cards,
    AbacusCards.cards
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    const AccountingAnimation(),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Column(
                        children: const [
                          CSSText(),
                          EventText(),
                          TagText(),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => engima_page(),
                                ));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            margin: EdgeInsets.all(20),
                            child: Container(
                              child: Image.asset(
                                "assets/images/event_thumbnails/enigmaa.jpg",
                                fit: BoxFit.fitHeight,
                              ),
                              height: MediaQuery.of(context).size.height * 0.26,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            elevation: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => abacus_page(),
                                ));
                          },
                          child: Card(
                            margin: EdgeInsets.all(20),
                            child: Container(
                              child: Image.asset(
                                "assets/images/event_thumbnails/abacus.png",
                                fit: BoxFit.cover,
                              ),
                              height: MediaQuery.of(context).size.height * 0.26,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            elevation: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Enigma_text(),
                        Abacus_text(),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: isExpanded
                        ? technoEventsSelected
                            ? 3658.0
                            : 1720
                        : 70, // Set the height according to the state of isExpanded
                    color: Colors.transparent,
                    child: isExpanded == true
                        ? SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(width: 20),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    GestureDetector(
                                      onTap: () => setState(() {
                                        technoEventsSelected = true;
                                        culturaleventsselected = false;
                                        abacuseventselected = false;

                                        index = 0;
                                        // isselected = true;
                                      }),
                                      child: Text(
                                        "Techno Events",
                                        style: TextStyle(
                                          fontFamily: "Cormorant Unicase",
                                          fontSize: 18,
                                          fontWeight: technoEventsSelected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: technoEventsSelected
                                              ? Pallet.accentColor
                                              : Theme.of(context)
                                                  .backgroundColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 30),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          technoEventsSelected = false;
                                          culturaleventsselected = true;
                                          abacuseventselected = false;
                                          index = 1;
                                        });
                                      },
                                      child: Text(
                                        "Cultural Events",
                                        style: TextStyle(
                                          fontFamily: "Cormorant Unicase",
                                          fontSize: 18,
                                          fontWeight: culturaleventsselected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: culturaleventsselected
                                              ? Pallet.accentColor
                                              : Theme.of(context)
                                                  .backgroundColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 30),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Events(cards: cards[index]),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        : Center(
                            child: Container(
                              height: 100,
                              child: Lottie.asset(
                                  "assets/lottie/scrolldownarrow.json"),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
