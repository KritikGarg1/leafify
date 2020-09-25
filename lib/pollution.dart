import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'airQualityProvider.dart';

class PollutionShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final airState = Provider.of<AirState>(context);
    //print(airState.getAir.aqi);
    if(airState.getAir==null)return Container();
    else
    return Row(crossAxisAlignment:CrossAxisAlignment.end,
      children: [
        Container(
          child:Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(airState.getAir.aqi.toString(),
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,
                        fontSize: 36, color: Color.fromRGBO(180, 50, 50, 1))),
                Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: Text("Air quality index ",
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,
                          fontSize: 11, color: Colors.black87)),
                ),
                Container(height: 2,width: 120,color: Color.fromRGBO(90, 90, 90, 0.5)),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(airState.getAir.level??=" ",
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,
                          fontSize: 16,color: Color.fromRGBO(180, 10, 10, 1))),
                ),
              ],
            ),
          ),
          width: 140,
          height: 130,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.70),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        Padding(

          padding: const EdgeInsets.only(left:8.0),
          child: Container(width: 55,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top:2.0,left: 4),
                child: Text(airState.getAir.temp.toString()+("\u00B0"),
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,
                        fontSize: 22,color: Colors.black87)),
              ),
            ),
            height: 55,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.70),
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),),
        ),
      ],
    );
  }
}
