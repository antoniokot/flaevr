import 'package:flaevr/components/compareCard.dart';
import 'package:flaevr/components/notFoundCompareCard.dart';
import 'package:flaevr/components/productCard.dart';
import 'package:flaevr/components/productGrid.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/pages/results.dart';
import 'package:flaevr/utils/compareList.dart' as globalCompareList;
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class Compare extends StatefulWidget {
  Compare({Key? key}) : super(key: key);



  @override
  CompareState createState() => CompareState();
}

class CompareState extends State<Compare> {
  List<ProductModel> compareList = globalCompareList.list;

  @override
  void initState() {
    super.initState();
    this.compareList = globalCompareList.list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Styles.sidePaddingWithVerticalSpace,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Comparação",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFF3D3D4E)
                    ),
                  ),
                  IconButton(
                    color: this.compareList.length <= 0 ? Color(0xFFBDBFBE) : Colors.black87,
                    onPressed: this.compareList.length <= 0 ? null : () => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))
                      ),
                      builder: (context) {
                        return Container(
                          height: 400,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    'Lista de produtos selecionados',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color(0xFF3D3D4E),
                                    )
                                  )
                                ),
                                this.compareList.length > 0 
                                ? SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      ProductGrid(
                                        physics: new NeverScrollableScrollPhysics(),
                                        built: true,
                                        products: this.compareList
                                      ),
                                      Container(
                                        child: InkWell(
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
                                            ).then((_) => setState(() {}))
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                : NotFoundCompareCard()
                              ],
                            ),
                          ),
                        );
                      }
                    ).then((_) => setState(() {})),
                    icon: new Icon(Icons.folder_open)
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 400,
                      child: compareList.length > 0
                        ? ListView.builder(
                          itemCount: compareList.length,
                          itemBuilder: (BuildContext context, int index) =>
                          CompareCard(
                            heightAspectRatio: new AspectRatio(aspectRatio: 2.3),
                            width: 140,
                            product: compareList[index],
                          )
                        )
                        : /*NotFoundCompareCard(),*/Container(
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
                                  ).then((_) => setState(() {}))
                                },
                              ),
                            ],
                          ),
                        )
                    )
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
