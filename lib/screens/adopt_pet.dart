import 'package:flutter/material.dart';

import '../models/pet_model.dart';

class AdoptPetScreen extends StatefulWidget {
  final Pet pet;
  AdoptPetScreen(this.pet);

  @override
  _AdoptPetScreenState createState() => _AdoptPetScreenState();
}

class _AdoptPetScreenState extends State<AdoptPetScreen> {
  Widget _buildCard(String label, String content) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 100,
      // height: 100,
      decoration: BoxDecoration(
        color: Color(0xfff8f2f7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.red,
              fontFamily: "Montserrat",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            content,
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Montserrat",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.pet.id,
                  child: Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          widget.pet.imageUrl,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.pet.name,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    iconSize: 30,
                    color: Colors.red,
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                widget.pet.description,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.grey,
                  fontSize: 16,
                  // fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 120,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  _buildCard("Age", widget.pet.age.toString()),
                  _buildCard("Sex", widget.pet.sex),
                  _buildCard("Color", widget.pet.color),
                  _buildCard("ID", widget.pet.id.toString()),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 30),
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                color: Color(0xfffff2d0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                leading: CircleAvatar(
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(
                        widget.pet.owner.imageUrl,
                      ),
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                title: Text(
                  widget.pet.owner.name,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Owner",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: Colors.red,
                  ),
                ),
                trailing: Text(
                  "1.68 km",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Text(
                widget.pet.owner.bio,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15,
                  height: 1.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 60,
                    height: 50,
                    child: IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {},
                    ),
                  ),
                  FlatButton.icon(
                    padding: EdgeInsets.all(20),
                    color: Colors.deepOrange,
                    icon: Icon(
                      Icons.pets,
                      color: Colors.white,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    label: Text(
                      "Adoptation",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 1.5,
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
