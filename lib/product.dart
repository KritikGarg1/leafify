import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String src =
    "https://i.ibb.co/6XjvnSV/kisspng-chocolate-bar-cadbury-dairy-milk-nut-dairy-5ad037c29ecdd5-1.png";

class Product extends StatelessWidget {
  final String isbn;
  final double cf;
  final String imgUrl;
  final String name;

  Product(this.isbn, this.cf, this.imgUrl,this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:18.0,bottom: 18,left: 10,right: 10),
            child: Image.network(imgUrl),
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
                Text(name,
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,
                        fontSize: 16, color: Colors.black87)),
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
      width: 250,
      height: 190,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255,0.85),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
