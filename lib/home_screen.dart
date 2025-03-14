import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mega_city_cab/colors.dart';
import 'package:mega_city_cab/data.dart';

import 'car_detail_screen.dart';
import 'car_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectdIndex = 0;
  int _selectedCategory = 0;
  final categories = ['All', 'Tesla', 'BMW', 'Benz', 'Audi'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColors.primary,
                  AppColors.secondary,
                ],
                    begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello! Fernando,",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          ),
                          SizedBox(height: 5),
                          Text("Find your Dream Car",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: Padding(padding: EdgeInsets.all(8),
                          child: Icon(Icons.notifications_none_rounded,
                          color: Colors.white,
                          size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: AppColors.cardBg,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search,
                        color: AppColors.textLight),
                        SizedBox(width: 10),
                        Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search for your dream car',
                                hintStyle: TextStyle(color: AppColors.textLight),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 15),
                              ),
                            ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.secondary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.tune,
                            color: AppColors.secondary,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Categories
                  SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),),
                      SizedBox(height: 15),
                      SizedBox(
                        height: 45,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final isSelected = _selectedCategory == index;
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selectedCategory == index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                padding: EdgeInsets.symmetric(
                                     horizontal: 25
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.secondary
                                      : AppColors.cardBg,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    if(isSelected)
                                      BoxShadow(
                                        color: AppColors.secondary
                                            .withOpacity(0.3),
                                        blurRadius: 10,
                                        offset: Offset(0, 5),
                                      ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    categories[index],
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : AppColors.textLight,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  // Featured Cars
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Featured Cars",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          TextButton(onPressed: (){},
                            child: Text("View All",
                            style: TextStyle(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w600,
                            ),),),
                        ],
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                         height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: featuredCars.length,
                          itemBuilder: (context, index) {
                            return _buildCarCard(featuredCars[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Popular Deals
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Popular Deals",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          TextButton(onPressed: (){},
                            child: Text("View All",
                              style: TextStyle(
                                color: AppColors.secondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: featuredCars.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CarDetailScreen(car: featuredCars[index]),
                              ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                color: AppColors.cardBg,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Padding(padding: EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width:  120,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        featuredCars[index].image,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(featuredCars[index].name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: AppColors.textDark,
                                        ),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Icon(Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                            ),
                                            SizedBox(width: 5),
                                            Text(featuredCars[index].rating.toString(),
                                              style: TextStyle(
                                                color: AppColors.textLight,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('\$${featuredCars[index].price}/day',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: AppColors.secondary,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 12,
                                              vertical: 6),
                                              decoration: BoxDecoration(
                                                color: AppColors.secondary.withOpacity(0.1),
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Text("Book Now",
                                              style: TextStyle(
                                                color: AppColors.secondary,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                              ),),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
       ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: BottomNavigationBar(
            currentIndex: _selectdIndex,
            onTap: (index){
              setState(() {
                _selectdIndex = index;
              });
            },
            backgroundColor: Colors.transparent,
            selectedItemColor: AppColors.secondary,
            unselectedItemColor: AppColors.textLight,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(_selectdIndex == 0 ? Icons.home : Icons.home_outlined,
                  size: 24,),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(_selectdIndex == 1 ? Icons.favorite : Icons.favorite_outlined,
                  size: 24,),
                label: "Favorites",
              ),
              BottomNavigationBarItem(
                icon: Icon(_selectdIndex == 2 ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                  size: 24,),
                label: "Favorites",
              ),
              BottomNavigationBarItem(
                icon: Icon(_selectdIndex == 3 ? Icons.person : Icons.person_outlined,
                  size: 24,),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildCarCard(Car car){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CarDetailScreen(car: car),
        ));
      },
      child: Container(
        width: 220,
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
              ),
              child: Center(
                child: Hero(tag: car.name, child: Image.asset(
                  car.image,
                  height: 120,
                  fit: BoxFit.contain,
                )),
              ),
            ),
            Padding(padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(car.brand,
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 14,
                  ),
                  ),
                  SizedBox(height: 5),
                  Text(car.name,
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                   Row(
                     children: [
                       Icon(Icons.star,
                       color: Colors.amber,
                         size: 18,
                       ),
                       SizedBox(width: 5),
                       Text(
                         car.rating.toString(),
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           color: AppColors.textDark,
                         ),
                       ),
                     ],
                   ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${car.price}/day',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.secondary,
                      ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.arrow_forward,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
