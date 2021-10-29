import 'package:flaevr/pages/compare_search.dart';
import 'package:flaevr/pages/search.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class CompareCard extends StatefulWidget {
  const CompareCard({ Key key }) : super(key: key);

  @override
  _CompareCardState createState() => _CompareCardState();
}

class _CompareCardState extends State<CompareCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: IntrinsicWidth(
          child: Column(  
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 180,  // só aceita q eh esse numero
                  width: 400,
                  decoration: BoxDecoration(
                    //color: Color(0xFFFFFFFF),
                    color: Color(0xFFFE6767),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18.0), 
                      topLeft: Radius.circular(18.0), 
                      bottomRight: Radius.circular(18.0), 
                      bottomLeft: Radius.circular(18.0)
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.tag_faces,
                        color: Color(0xFFFFFFFF),
                      ),
                      Text(
                        "Parece que você ainda não adicionou nenhum produto para comparar. Quer adicionar um?",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      Text(
                        "Adicionar",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: () => {
            Navigator.push(
              context, MaterialPageRoute(
                  builder: (context) => Search()))
          },
        ),
    );
  }
}