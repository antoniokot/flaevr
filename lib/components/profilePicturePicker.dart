import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfilePicturePicker extends StatelessWidget {
  void setProfileImage(int imgIndex) {}

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 75,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return InkWell(
                  child: Container(
                decoration: BoxDecoration(
                  color: Styles.ultraLightMutedGrey,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add,
                  color: Styles.mutedGrey,
                  size: 32,
                ),
              ));
            }
            return InkWell(
                onTap: () => setProfileImage(index),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("lib/assets/images/avatars/prof" +
                              index.toString() +
                              ".png"))),
                ));
          }),
    );
  }
}
