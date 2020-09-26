import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
String src =
    "https://i.ibb.co/6XjvnSV/kisspng-chocolate-bar-cadbury-dairy-milk-nut-dairy-5ad037c29ecdd5-1.png";

class Product extends StatelessWidget {
  final String isbn;
  final double cf;
  final String imgUrl;
  final String name;
  final bool load;

  Product(this.isbn, this.cf, this.imgUrl,this.name,this.load);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          load?Container(width:130,height: 130,child:SpinKitWave(size: 30, color: Colors.teal,)):
          Padding(
            padding: const EdgeInsets.only(top:18.0,bottom: 18,left: 10,right: 10),
            child: Container(width:130,height: 130,child: Image.network(imgUrl)),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("ISBN "+isbn,
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,
                        fontSize: 12, color: Colors.black87)),
                SizedBox(height: 5,),
                Container(width: 150,
                  child: Text(name,maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,
                          fontSize: 13, color: Colors.black87)),
                ),
                SizedBox(height: 10,),
                Container(width: 120,height:2,color: Colors.black,),
                SizedBox(height: 2),
                Text(cf.toString(),
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w700,
                        fontSize: 55, color: Colors.teal)),
                Text("Carbon footprint",
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,
                        fontSize: 14, color: Colors.black87)),
              ],
            ),
          )
        ],
      ),
      width: 310,
      height: 190,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255,0.85),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
