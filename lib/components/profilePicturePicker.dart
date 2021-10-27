import 'dart:js';

import 'package:flaevr/services/AllergensService.dart';
import 'package:flaevr/services/UserService.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class ProfilePicturePicker extends StatelessWidget {
  @override
  ProfilePicturePicker({this.id});

  final int id;

  void setProfileImage(int imgIndex, BuildContext context) {
    if (imgIndex > 9 || imgIndex < 1) return;

    UserService.putProfilePic(this.id, imgIndex.toString()).then((value) async {
      dynamic session = new FlutterSession();

      await session
          .set("user", await UserService.getByID(this.id))
          .then((value) => Navigator.pop(context));
    });
  }

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
                onTap: () => setProfileImage(index, context),
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
