

import 'package:characters_bloc/Routes_method/routes.dart';
import 'package:characters_bloc/data/model/characters_model.dart';
import 'package:flutter/material.dart';

class characterItem extends StatelessWidget {
  final CharactersModel character;
  const characterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.grey),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.charactersDetail,
              arguments: character);
        },
        child: GridTile(
          child: Hero(
            tag: character.charId!,
            child: Container(
              child: character.img!.isNotEmpty
                  ? FadeInImage
                      .assetNetwork //الويدجت دى بتحطلها صورة من عندك على م الصورة الى جايه من النت تتحمل
                      (
                      placeholder: 'assets/images/loading.gif',
                      image: character.img!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/waiting.gif'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            child: Text(
              '${character.name}',
              style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              overflow:
                  TextOverflow.ellipsis, //لوالاسم طويل تكملة بنقط زى الخ..,),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ),
      ),
    );
  }
}
