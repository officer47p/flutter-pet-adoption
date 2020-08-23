import 'package:flutter/material.dart';

import './adopt_pet.dart';
import '../models/pet_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildPetCard(Pet pet) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AdoptPetScreen(pet),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: 40, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: pet.id,
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  color: Colors.deepOrange,
                  image: DecorationImage(
                    image: AssetImage(
                      pet.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 40, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pet.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                    ),
                    iconSize: 30,
                    color: Colors.red,
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 40, 12),
              child: Text(
                pets[0].description,
                style: TextStyle(
                    fontFamily: "Montserrat", color: Colors.grey, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(bool isSelected, String text) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 80,
      decoration: BoxDecoration(
          color: isSelected
              ? Colors.deepOrange.withOpacity(0.8)
              : Color(0xfff8f2f7),
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? Border.all(
                  color: Colors.red[100],
                  width: 8,
                )
              : null),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.only(left: 40, top: 40),
            // color: Colors.deepOrange,
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              child: ClipOval(
                child: Image(
                  width: 40,
                  height: 40,
                  image: AssetImage("assets/images/user.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            // color: Colors.amberAccent,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              style: TextStyle(
                fontSize: 22,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
              ),
              initialValue: "New York, NY",
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 10),
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Icon(
                    Icons.add_location,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
                labelText: "Location",
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: Divider(
                // thickness: 1,
                ),
          ),
          Container(
            height: 100,
            // color: Colors.red,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 35,
                    ),
                    onPressed: () {},
                  ),
                ),
                _buildCategoryCard(false, "Dogs"),
                _buildCategoryCard(true, "Cats"),
                _buildCategoryCard(false, "Birds"),
                _buildCategoryCard(false, "Others"),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          _buildPetCard(pets[0]),
          _buildPetCard(pets[1]),
        ],
      ),
    );
  }
}
