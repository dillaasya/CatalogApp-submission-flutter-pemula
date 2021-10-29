import 'package:catalog_app/model/card_model.dart';
import 'package:catalog_app/model/list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

import 'detail_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 8),
        child: ListView(
          children: <Widget>[

            const SizedBox(
              height: 25,
            ),

            //Title
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 10, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Hi, User!', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500,)),
                  Text('Catalog App', style: GoogleFonts.inter(fontSize: 30, fontWeight: FontWeight.w700
                  ),),
                ],
              ),
            ),

            //Search Features
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: CupertinoSearchTextField(
                borderRadius: BorderRadius.circular(10)
              )
            ),


            //Card Of Most Popular
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16, right: 10, top:20),
                  itemCount: cards.length,
                  itemBuilder: (context, index){
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey
                  ),

                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 25, bottom:25,
                          child:Text(
                            cards[index].user, style: GoogleFonts.inter(fontSize: 15,fontWeight: FontWeight.w700),
                          )
                      )
                    ],
                  )
                );
              }),
            ),

            //Product List
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 25, bottom: 15),
              child: Row(
                children: <Widget>[
                  Text('Product List', style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w700),),
                ],
              ),
            ),

            //List View
            ListView.builder(
                physics: const ClampingScrollPhysics(),
              itemCount: catalog.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 16, right:16),
              itemBuilder: (context, index){
                final CatalogModel product = catalog[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return DetailScreen(item: product);
                    }));
                  },

                  child: Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                        children: <Widget>[
                          Container(
                            height: 90,
                            width: 90,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(catalog[index].image)
                                )
                            ),
                          ),

                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  catalog[index].name,
                                  style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w700),
                                ),
                                Text(catalog[index].subDesc, style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w400,)),
                                Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: Text(
                                      catalog[index].price,
                                      style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w600,),
                                    )
                                ),

                              ]
                          ),
                        ]
                    ),
                  )



                );
              }
            )
          ],
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
        color: Colors.red
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