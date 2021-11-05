import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  @override
  CategoryCard(this.icon, this.title, this.stats);

  final ImageProvider icon;
  final double stats;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        decoration: new BoxDecoration(
          color: Styles.ultraLightMutedGrey,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.23),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: Styles.sidePaddingWithVerticalSpace,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.title,
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3d3d4e)),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 12,
              ),
              Center(
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: icon, fit: BoxFit.fill),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                this.stats.toString() + "%",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3d3d4e)),
              ),
              Text(
                "dos produtos escaneados.",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Styles.mutedGrey),
              )
            ],
          ),
        ));
  }
}
