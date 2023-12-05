import 'package:flutter/material.dart';

class TrendWidget extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return GridView.count(
      childAspectRatio: 0.68,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
//one      
        Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [

              InkWell(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    "assets/images/img1.png",
                    height: 200,
                    width: 250,
                  ),
                ),
              ),

              Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Keeping the environment clean",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ),
                  
                  Padding(padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Save 12.105 Trees",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,

                        ),
                      ),
                      
                  ]),
                  )
            ],
          ),
        ),

        

// two
        Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Environmental Impact",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ),
                  Container(
                    alignment:Alignment.centerLeft ,
                    child: Text(
                      "Prevention of Pollution: Urban EcoFlow helps prevent pollution by removing and properly disposing of potentially hazardous materials. It reduces the risk of soil, air, and water pollution.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reduce Recycle Reuse",
                        style: TextStyle(
                          fontSize: 7,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,

                        ),
                      ),

                  ]),
                  )
            ],
          ),
        ),
        //three     
        Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [

              InkWell(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    "assets/images/imag3.png",
                    height: 200,
                    width: 250,
                  ),
                ),
              ),

              Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Keeping the environment clean",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ),
                  
                  Padding(padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Save 12.105 Trees",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,

                        ),
                      ),
                      
                  ]),
                  )
            ],
          ),
        ),


        Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Public Health",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ),
                  Container(
                    alignment:Alignment.centerLeft ,
                    child: Text(
                      "Inadequate waste collection can lead to the proliferation of disease vectors such as rats and mosquitoes. Proper waste collection helps control these vectors, reducing the risk of diseases.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reduce Recycle Reuse",
                        style: TextStyle(
                          fontSize: 7,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,

                        ),
                      ),

                  ]),
                  )
            ],
          ),
        ),
        //four     
        Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [

              InkWell(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    "assets/images/imag4.png",
                    height: 200,
                    width: 250,
                  ),
                ),
              ),

              Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Keeping the environment clean",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ),
                  
                  Padding(padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Save 12.105 Trees",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,

                        ),
                      ),
                      
                  ]),
                  )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Reduction of illegal Dumping",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ),
                  Container(
                    alignment:Alignment.centerLeft ,
                    child: Text(
                      "Regular and accessible waste collection services reduce the likelihood of illegal dumping, which can harm the environment and public health.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reduce Recycle Reuse",
                        style: TextStyle(
                          fontSize: 7,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,

                        ),
                      ),

                  ]),
                  )
            ],
          ),
        ),


      ],
    );
  }
}
