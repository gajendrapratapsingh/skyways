import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skyways_group/constants/constant.dart';

class Info extends StatelessWidget {
  const Info({
    Key key,
    this.name,
    this.designation,
    this.id,
    this.bloodgroup,
    this.image,
  }) : super(key: key);
  final String name, designation, id, bloodgroup, image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: defaultSize * 24, // 240
      height: MediaQuery.of(context).size.height * 0.32,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 150,
              color: kCornerShapeColor,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                /*AvatarGlow(
                  startDelay: Duration(milliseconds: 1000),
                  glowColor: Colors.blue,
                  endRadius: 90.0,
                  duration: Duration(milliseconds: 2000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 100),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFF372D61),
                    child: Text(
                      snapshot.data['name'][0],
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                  ),
                  shape: BoxShape.circle,
                  animate: true,
                  curve: Curves.fastOutSlowIn,
                ),*/
                Container(
                  margin: EdgeInsets.only(bottom: 10), //10
                  height: MediaQuery.of(context).size.height * 0.14, //140
                  width: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 4, //8
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: image == "" || image == null
                          ? AssetImage('assets/images/no_image.jpg')
                          : NetworkImage(image),
                    ),
                  ),
                ),
                Text(
                  name == "" || name == null ? "" : name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 22, // 22
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5), //5
                Text(
                  designation == "" || designation == null ? "" : designation,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(height: 5), //5
                Text(
                  id == "" || id == null ? "" : "Employee ID: " + id,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                bloodgroup == "" || bloodgroup == null
                    ? Container()
                    : Text(
                        "Blood Group: " + bloodgroup,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
