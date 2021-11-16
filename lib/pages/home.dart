import 'package:flaevr/components/categoryCard.dart';
import 'package:flaevr/components/gaugeChart.dart';
import 'package:flaevr/components/notFound.dart';
import 'package:flaevr/components/ripple.dart';
import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/models/Stamp.dart';
import 'package:flaevr/models/User.dart';
import 'package:flaevr/services/ProductService.dart';
import 'package:flaevr/services/StampService.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flaevr/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/utils/sessionManager.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  User? user;
  List<ProductModel>? recents;
  int numberOfItems = 0;
  double vegPercentage = 0;
  double healthyPercentage = 0;
  double animalPercentage = 0;

  void getUser() async {
    this.user = User.fromJson(await FlutterSession().get("user"));
    this.numberOfItems = await getNumberOfItems();
    getStampStats();
    this.vegPercentage = percentage(
        await ProductService.getCountOfAllScannedByStamp(this.user!.id!, 13),
        numberOfItems);
    this.healthyPercentage = percentage(
        await ProductService.getCountOfAllScannedByStamp(this.user!.id!, 2),
        numberOfItems);
    this.animalPercentage = percentage(
        await ProductService.getCountOfAllScannedByStamp(this.user!.id!, 6),
        numberOfItems);
    setState(() {});
  }

  void getStampStats() async {
    this.vegPercentage = percentage(
        await ProductService.getCountOfAllScannedByStamp(this.user!.id!, 13),
        numberOfItems);
    this.healthyPercentage = percentage(
        await ProductService.getCountOfAllScannedByStamp(this.user!.id!, 2),
        numberOfItems);
    this.animalPercentage = percentage(
        await ProductService.getCountOfAllScannedByStamp(this.user!.id!, 6),
        numberOfItems);
  }

  Future<int> getNumberOfItems() async {
    this.recents =
        await ProductService.getAllRecentProducts(this.user!.id as int);
    return recents!.length;
  }

  String getFormattedDate() {
    DateTime date = DateTime.now();
    String day = DateFormat('dd').format(date);
    var months = [
      "JAN",
      "FEV",
      "MAR",
      "ABR",
      "MAI",
      "JUN",
      "JUL",
      "AGO",
      "SET",
      "OUT",
      "NOV",
      "DEZ"
    ];
    String month = months[int.parse(DateFormat('MM').format(date))];
    String dayOfTheWeek = DateFormat('EEEE').format(date);
    return (Utility.capitalize(dayOfTheWeek.substring(0, 3)) +
        ", " +
        day +
        " " +
        month);
  }

  void initState() {
    super.initState();
    getUser();
  }

  double percentage(int part, int total) {
    return (part * 100) / total;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 19.0, vertical: 29.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getFormattedDate(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Color(0xFFFF4646)),
                            ),
                            Text(
                              "Olá, " +
                                  (this.user == null
                                      ? ""
                                      : this.user!.name!.split(" ")[0]),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Color(0xFF3D3D4E)),
                            ),
                          ]),
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: this.user != null
                                  ? this.user!.avatar == null
                                      ? AssetImage(
                                          "lib/assets/images/avatars/prof1.png")
                                      : Utility.isNumeric(this.user!.avatar) ==
                                              false
                                          ? NetworkImage(this.user!.avatar!)
                                          : AssetImage(
                                              "lib/assets/images/avatars/prof" +
                                                  this.user!.avatar! +
                                                  ".png") as ImageProvider
                                  : AssetImage(
                                      "lib/assets/images/avatars/prof1.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 170,
                      child: Center(
                        child: Container(
                            height: 130,
                            decoration: new BoxDecoration(
                              color: Styles.ultraLightMutedGrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.23),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 30),
                                child: Row(
                                  children: [
                                    RipplesAnimation(
                                      animateChild: false,
                                      size: 25,
                                      color: Color(0xFFFF4646),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFF4646),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(75)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.23),
                                                spreadRadius: 2,
                                                blurRadius: 3,
                                                offset: Offset(0,
                                                    2), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          width: 45,
                                          height: 45,
                                          child: Center(
                                              child: Text(
                                            numberOfItems.toString(),
                                            style: TextStyle(
                                                fontSize: 27.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ))),
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Text("Seu score",
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Styles.textBlack,
                                                      fontWeight:
                                                          FontWeight.w600))),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Text(
                                                  "Você escaneou " +
                                                      this
                                                          .numberOfItems
                                                          .toString() +
                                                      " produtos essa semana!",
                                                  style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: Styles.mutedGrey,
                                                      fontWeight:
                                                          FontWeight.w500)))
                                        ],
                                      ),
                                    )
                                  ],
                                ))),
                      )),
                  Center(
                      child: Container(
                          width: 280,
                          height: 102,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 102,
                                      child: GaugeChart(
                                        this.vegPercentage == 0
                                            ? 10.0
                                            : this.vegPercentage,
                                        color: Color(0xFF76e75a),
                                        animate: true,
                                        width: 0.21,
                                      ),
                                    ),
                                    Icon(Icons.spa, color: Color(0xFF76e75a)),
                                    Positioned(
                                      bottom: 0,
                                      child: Text("Veganos",
                                          style: Styles.smallText),
                                    ),
                                  ],
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 102,
                                      child: GaugeChart(
                                        this.healthyPercentage == 0
                                            ? 10.0
                                            : this.healthyPercentage,
                                        color: Color(0xFFff3858),
                                        animate: true,
                                        width: 0.21,
                                      ),
                                    ),
                                    Icon(Icons.favorite,
                                        color: Color(0xFFff3858)),
                                    Positioned(
                                      bottom: 0,
                                      child: Text("Saudáveis",
                                          style: Styles.smallText),
                                    ),
                                  ],
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 102,
                                      child: GaugeChart(
                                        this.animalPercentage == 0
                                            ? 10.0
                                            : this.animalPercentage,
                                        color: Color(0xFF5dc9a9),
                                        animate: true,
                                        width: 0.21,
                                      ),
                                    ),
                                    Icon(Icons.pets, color: Color(0xFF5dc9a9)),
                                    Positioned(
                                      bottom: 0,
                                      child: Text("Bem Animal",
                                          style: Styles.smallText),
                                    ),
                                  ],
                                ),
                              ]))),
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.3,
              maxChildSize: 0.9,
              expand: true,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.23),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, -1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 19, vertical: 16),
                      child: FutureBuilder<List<Stamp>?>(
                        future: StampService.getAllStamps(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return GridView.builder(
                              physics: BouncingScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 30,
                                      crossAxisSpacing: 30,
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.87),
                              controller: scrollController,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return FutureBuilder<int>(
                                    future: ProductService
                                        .getCountOfAllScannedByStamp(
                                            this.user!.id!,
                                            snapshot.data![index].id),
                                    builder: (context, snapshotp) {
                                      if (snapshotp.hasData) {
                                        return CategoryCard(
                                            AssetImage(
                                                "lib/assets/images/badges/" +
                                                    snapshot.data![index].name +
                                                    ".png"),
                                            snapshot.data![index].name,
                                            snapshotp.data!);
                                      } else if (snapshotp.hasError) {
                                        return NotFound(text: "Que vazio!");
                                      }
                                      return CategoryCard(
                                          AssetImage(
                                              "lib/assets/images/badges/" +
                                                  snapshot.data![index].name +
                                                  ".png"),
                                          snapshot.data![index].name,
                                          0);
                                    });
                              },
                            );
                          } else if (snapshot.hasError) {
                            return NotFound(text: "Que vazio!");
                          }
                          // By default, show a loading skeleton.
                          return GridView.builder(
                            physics: BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 30,
                                    crossAxisSpacing: 30,
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.85),
                            controller: scrollController,
                            itemCount: 25,
                            itemBuilder: (BuildContext context, int index) {
                              return Skeleton(height: 140);
                            },
                          );
                        },
                      ),
                    ));
              },
            ),
          ])),
    );
  }
}
