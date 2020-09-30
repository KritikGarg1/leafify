import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'database.dart';


String src =
    "https://i.ibb.co/6XjvnSV/kisspng-chocolate-bar-cadbury-dairy-milk-nut-dairy-5ad037c29ecdd5-1.png";

class Product extends StatelessWidget {
  final String isbn;
  final double cf;
  final String imgUrl;
  final String name;
  final bool load;

  Product(this.isbn, this.cf, this.imgUrl, this.name, this.load);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          child: Row(
            children: [
              load
                  ? Container(
                      width: 130,
                      height: 130,
                      child: SpinKitWave(
                        size: 30,
                        color: Colors.teal,
                      ))
                  : Padding(
                      padding: const EdgeInsets.only(
                          top: 18.0, bottom: 18, left: 10, right: 10),
                      child: Container(
                          width: 130,
                          height: 130,
                          child: Image.network(imgUrl)),
                    ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("ISBN " + isbn,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.black87)),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 150,
                      child: Text(name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Colors.black87)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 120,
                      height: 2,
                      color: Colors.black,
                    ),
                    SizedBox(height: 2),
                    Text(cfx[isbn],
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            fontSize: 55,
                            color: Colors.teal)),
                    Text("Carbon footprint",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black87)),
                  ],
                ),
              )
            ],
          ),
          width: 310,
          height: 190,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.85),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0,bottom: 3),
          child: Container(
            width: 300,
            child: Center(
              child: Text("Greener Alternatives",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white)),
            ),
          ),
        ),
        Container(
          width: 290,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          load
                              ? Container(
                                  width: 85,
                                  height: 100,
                                  child: SpinKitWave(
                                    size: 30,
                                    color: Colors.teal,
                                  ))
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, bottom: 5, left: 3),
                                  child: Container(
                                      width: 85,
                                      height: 100,
                                      child:
                                          Image.network(similar[isbn][0].url)),
                                ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0, top: 6.0),
                            child: Text(similar[isbn][0].offset.toString(),
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.teal)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: 120,
                              child: Text(similar[isbn][0].name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Colors.black87)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  width: 139,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.85),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          load
                              ? Container(
                                  width: 90,
                                  height: 100,
                                  child: SpinKitWave(
                                    size: 30,
                                    color: Colors.teal,
                                  ))
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, bottom: 5, left: 4),
                                  child: Container(
                                      width: 90,
                                      height: 100,
                                      child:
                                          Image.network(similar[isbn][1].url)),
                                ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0, top: 6.0),
                            child: Text(similar[isbn][1].offset.toString(),
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.teal)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: 120,
                              child: Text(similar[isbn][1].name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Colors.black87)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  width: 139,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.85),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
