// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:labexc/action_button.dart';
import 'package:labexc/colorslider.dart';

class statemangment extends StatefulWidget {
  const statemangment({super.key});

  @override
  State<statemangment> createState() => _statemangmentState();
}

class _statemangmentState extends State<statemangment> {
  double iconsize = 150;
  Color iconColor = Colors.blue;
  double currentRedvalue = 0;
  double currentGreenvalue = 0;
  double currentBluevalue = 0;
  bool? resize = true;
  bool? changecolor = true;

  void _updateColor(double red, double green, double blue) {
    setState(() {
      iconColor = Color.fromRGBO(red.toInt(), green.toInt(), blue.toInt(), 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("allow resize?"),
              trailing: Checkbox(
                value: resize,
                onChanged: (value) {
                  setState(() {
                    resize = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("allow change primer color?"),
              trailing: Checkbox(
                value: changecolor,
                onChanged: (value) {
                  setState(() {
                    changecolor = value;
                  });
                },
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("My Icon"),
        backgroundColor: Colors.brown,
        actions: [
          resize != null
              ? resize!
                  ? Container(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                iconsize -= 50;
                              });
                            },
                            icon: const Icon(Icons.remove_circle_outline),
                          ),
                          IconButton(
                            icon: const CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 15,
                              child: Text(
                                'S',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                iconsize = 100;
                              });
                            },
                          ),
                          IconButton(
                            icon: const CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 15,
                              child: Text(
                                'M',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                iconsize = 300;
                              });
                            },
                          ),
                          IconButton(
                            icon: const CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 15,
                              child: Text(
                                'L',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                iconsize = 500;
                              });
                            },
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                iconsize += 50;
                              });
                            },
                            icon: const Icon(Icons.add_circle_outline),
                          )
                        ],
                      ),
                    )
                  : Container()
              : Container()
        ],
      ),
      body: Center(
        child: Icon(
          Icons.alarm,
          size: iconsize,
          color: iconColor,
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ColorSlider(
                      colorchange: changecolor,
                      colorvalue: currentRedvalue,
                      onChanged: (value) {
                        setState(() {
                          _updateColor(
                              value, currentGreenvalue, currentBluevalue);
                          currentRedvalue = value;
                        });
                      },
                    )),
              ),
              ActionButton(
                changeColor: changecolor,
                btncolor: Colors.red,
                colorvalue: currentRedvalue,
                onPressed: () {
                  currentBluevalue = 0;
                  currentGreenvalue = 0;
                  currentRedvalue = 255;
                  _updateColor(currentRedvalue, 0, 0);
                },
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ColorSlider(
                        colorchange: changecolor,
                        onChanged: (value) {
                          setState(() {
                            _updateColor(
                                currentRedvalue, value, currentBluevalue);
                            currentGreenvalue = value;
                          });
                        },
                        colorvalue: currentGreenvalue)),
              ),
              ActionButton(
                changeColor: changecolor,
                btncolor: Colors.green,
                colorvalue: currentGreenvalue,
                onPressed: () {
                  currentBluevalue = 0;
                  currentGreenvalue = 255;
                  currentRedvalue = 0;
                  _updateColor(0, currentGreenvalue, 0);
                },
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ColorSlider(
                      colorchange: changecolor,
                      colorvalue: currentBluevalue,
                      onChanged: (value) {
                        setState(() {
                          _updateColor(
                              currentRedvalue, currentGreenvalue, value);
                          currentBluevalue = value;
                        });
                      },
                    )),
              ),
              ActionButton(
                changeColor: changecolor,
                colorvalue: currentBluevalue,
                btncolor: Colors.blue,
                onPressed: () {
                  currentBluevalue = 255;
                  currentGreenvalue = 0;
                  currentRedvalue = 0;
                  _updateColor(0, 0, currentBluevalue);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
