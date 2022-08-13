import 'package:characters_bloc/data/model/characters_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Charactersdetails extends StatefulWidget {
  final CharactersModel character;
  const Charactersdetails({super.key, required this.character});

  @override
  State<Charactersdetails> createState() => _CharactersdetailsState();
}

class _CharactersdetailsState extends State<Charactersdetails> {
  Widget apparSliver() {
    return SliverAppBar(
      expandedHeight: 600,
      stretch: true,
      pinned: true,
      backgroundColor: Colors.grey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          widget.character.nickname!,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        background: Hero(
          tag: widget.character.charId!,
          child: Image.network(
            widget.character.img!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
Widget characterInfo(String title,String value){
    return RichText(//هنا تقدر تتحكم فى كل كلمة من خلال timespan
      maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(text: title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white)),
          TextSpan(text: value,style: TextStyle(fontSize: 16,color: Colors.white)),
        ],

        )
      ,);
}
Widget buildDivider(double endIndentVar/*طول الخط تحت الكلمة*/){
    return Divider(
      color: Colors.amber,
      thickness: 2  ,
      endIndent: endIndentVar,//دى قيمةالمسافة كل ماتزيد ينقص الخط اللى تحت الكلمة
      height: 30,
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          apparSliver(),
          SliverList(delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  characterInfo('jobs: ',widget.character.occupation!.join(' / ')),//join بتفك الليسته وتجمعها مع بعض غلى حسب الفاصل زى  /
                  buildDivider(315),
                  characterInfo('Appeared in: ', widget.character.category!),
                  buildDivider(250),
                  characterInfo('seasons: ', widget.character.appearance!.join(' / ')),
                  buildDivider(300),
                  characterInfo('status: ', widget.character.status!),
                  buildDivider(250),
                  widget.character.betterCallSaulAppearance!.isNotEmpty?

                      characterInfo('beter call saul appearnce: ',
                          widget.character.betterCallSaulAppearance!.join(
                              ' / ')):Container(),
                  widget.character.betterCallSaulAppearance!.isNotEmpty?
                      buildDivider(300):Container(),


              ],),
            )
          ]

          ),),
        ],
      ),
    );
  }
}
