import 'package:catalog_app/model/list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';

class DetailScreen extends StatelessWidget {
  final CatalogModel item;

  const DetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              //App Bar Custom
              Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: Stack(
                  children: <Widget>[
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            const FavoriteButton(),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              //image product
              Container(
                height: 250,
                  alignment: Alignment.topCenter,
                  child:Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),),

                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage(item.image),
                          )
                          )
                  )
                ),



              //Product Name and Price
              Container(
                margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item.name, style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w700,),),
                    Text(item.price, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400,),)
                  ]
                )
              ),


              //Spesification
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16, top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const Icon(Icons.phonelink_setup),
                        const SizedBox(height: 8.0),
                        const Text("OS"),
                        Text(item.os),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        const Icon(Icons.battery_full),
                        const SizedBox(height: 8.0),
                        const Text("Battery"),
                        Text(item.battery),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        const Icon(Icons.line_weight),
                        const SizedBox(height: 8.0),
                        const Text("Weight"),
                        Text(item.weight),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                        child:(
                            Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
                                child: Row(
                                    children: <Widget>[
                                      Container(
                                          height: 80,
                                          width: 140,
                                          margin: const EdgeInsets.all(8),
                                        child:(
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 8.0),
                                                child: Text("CPU",style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w600),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 8.0),
                                                child: Text(item.cpuSpeed, style: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.w400),),
                                              ),
                                              Text(item.cpuType, style: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.w400)),
                                            ],
                                          )
                                        )
                                      ),
                                    ]
                                )
                            )
                        )
                    ),
                    SizedBox(
                        child:(
                            Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
                                child: Row(
                                    children: <Widget>[
                                      Container(
                                          height: 80,
                                          width: 140,
                                          margin: const EdgeInsets.all(8),
                                          child:(
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom: 8.0),
                                                    child: Text("Memory",style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w600),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom: 8.0),
                                                    child: Text(item.ram, style: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.w400),),
                                                  ),
                                                  Text(item.rom, style: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight.w400)),
                                                ],
                                              )
                                          )
                                      ),
                                    ]
                                )
                            )
                        )
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}


class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.white
        ,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}