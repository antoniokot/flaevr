import 'package:flaevr/pages/results.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class NotFoundCompareCard extends StatelessWidget {
  const NotFoundCompareCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(105.0),
            child: Image.network(
              'lib/assets/images/404.gif',
              height: 210.0,
              width: 210.0,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Styles.sidePadding.horizontal - 5, vertical: 10),
            child: Text(
              "Parece que você ainda não adicionou nenhum produto para comparar.\n Quer adicionar um?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Styles.textBlack,
                fontSize: 16,
              ),
            ),
          ),
          InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("Adicionar"),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 1.0, color: Styles.textBlack),
              ),
            ),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Results(),
                  )
              )
            },
          ),
        ],
      ),
    );
  }
}
