import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              FaIcon(FontAwesomeIcons.arrowLeft),
              FaIcon(FontAwesomeIcons.heart),
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Text("#002"),
            Text("Pokemon Name"),
            Text("Type1"), // make a ROW() later for other types
          ]),
          Stack(
            children: [
              const Positioned(
                left: 125,
                top: -20,
                child: CircleAvatar(
                  radius: 60,
                ),
              ),
              Container(
                  height: height / 1.5,
                  width: width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red[500]!,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}
