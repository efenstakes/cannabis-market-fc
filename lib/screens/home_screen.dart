import 'package:flutter/material.dart';
import 'package:weed_market/models/product.dart';
import 'package:weed_market/screens/product_details.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> _products = productList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        children: <Widget>[
          
          // top
          Padding(
            padding: EdgeInsets.only(
              left: 20, top: 32,
            ),
            child: _buildTopProfile(),
          ),

          SizedBox(height: 40,),

          // explore and search
          Padding(
            padding: const EdgeInsets.only(
              left: 20, top: 16, right: 20
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                // explore
                Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Color(0xfff548D80),
                  ),
                ),
                
                SizedBox(height: 40,),

                // search bar
                _buildSearchBar(),

              ],
            )
          ),

                
          SizedBox(height: 40,),

          // product horizontal list
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(
                  left: 20, top: 16, right: 20
                ),
                child: Row(
                  children: <Widget>[
                    
                    Icon(
                      Icons.smoking_rooms,
                      size: 36,
                      color: Color(0xfff548D80),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Hot Right Now',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xfff548D80),
                      ),
                    ),

                  ],
                ),
              ),

              SizedBox(height: 20,),

              _buildHorizontalProductList(),

              SizedBox(height: 40,),
              
              Padding(
                padding: const EdgeInsets.only(
                  left: 20, top: 16, right: 20
                ),
                child: Row(
                  children: <Widget>[
                    
                    Icon(
                      Icons.smoking_rooms,
                      size: 36,
                      color: Color(0xfff548D80),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Cannabis 101',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xfff548D80),
                      ),
                    ),

                  ],
                ),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.only(
                  left: 20, top: 16, right: 20
                ),
                child: _buildVerticalProductList(),
              ),

            ],
          )

        ],
      ),

    );
  }// Widget build(BuildContext context) { .. }
  

  Widget _buildTopProfile() {

    return Container(
      child: Row(
        children: <Widget>[

          ClipOval(
            child: Image(
              image: AssetImage('assets/images/gitl.png'),
              width: 48,
              height: 48,
            ),
          ),
          SizedBox(width: 12,),

          Text(
            'Hi, Jane',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xfff548D80),
            ),
          ),

        ],
      ),
    );
  }// Widget _buildTopProfile() { .. }

  Widget _buildSearchBar() {

    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Get some weed',
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }// Widget _buildSearchBar() { .. }

  Widget _buildHorizontalProductList() {
    List<Product> products = _products.take(8).toList();
 
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            
            ...products.map((Product prod) {

              return HorizontalProductCard(
                product: prod,
                onPress: this._onPressProduct,
              );
            }).toList()

          ],
        ),
      ),
    );
  }// Widget _buildHorizontalProductList() { .. }


  Widget _buildVerticalProductList() {
    List<Product> products = _products;
 
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          ...products.map((Product prod) {

            return VerticalProductCard(
              product: prod,
              onPress: this._onPressProduct,
            );
          }).toList()

        ],
      ),
    );
  }// Widget _buildVerticalProductList() { .. }



  void _onPressProduct({ @required Product product }) {

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_)=> ProductDetail(product: product)
      )
    );
  }// _onPressProduct({ @required Product product }) { .. }

}


class HorizontalProductCard extends StatelessWidget {
  Product product;
  Function onPress;

  HorizontalProductCard({ this.product, this.onPress });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return GestureDetector(

      child: Container(
        margin: EdgeInsets.only(
          left: 20,
        ),
        child: Stack(
          children: <Widget>[
            
            Container(
              height: screenSize.height*0.5,
              width: screenSize.width*0.4,
            ),


            Positioned(
              top: 64, // 10,
              left: 0,
              right: 0,
              child: Container(
                height: screenSize.height*0.5-64, // 10,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: screenSize.height*0.5*0.6,
                      left: 24, right: 24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: product.backgroundColor
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        ...product.name.split(" ").map((String namePart) {

                          return Text(
                            namePart,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color(0xfffe9f1f1),
                              letterSpacing: 0.8
                            ),
                          );
                        }).toList(),

                        SizedBox(height: 20,),

                        Text(
                          product.vibe,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xfffe9f1f1).withOpacity(0.6),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 0,
              left: 24,
              right: 24,
              height: screenSize.height*0.5*0.6,
              child: Container(
                height: screenSize.height*0.5*0.6,
                width: screenSize.height*0.5*0.6,
                // height: screenSize.height*0.2,
                // width: screenSize.height*0.15,
                // height: screenSize.height*0.3,
                // width: screenSize.height*0.3,
                // width: screenSize.width*0.4*0.2,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  // borderRadius: BorderRadius.circular(
                  //   64// 24
                  // ),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/${product.image}'), 
                  ),
         
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400],
                      blurRadius: 3,
                      spreadRadius: 3,
                    )
                  ]
                ),
              ),
            ),

          ],
        ),
      ),      

      onTap: ()=> onPress(product: product),
    );
  }// Widget build(BuildContext context) { .. }
}


class VerticalProductCard extends StatelessWidget {
  final Product product;
  final Function onPress;

  VerticalProductCard({ this.product, this.onPress });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return GestureDetector(

      child: Container(
        height: screenSize.height*0.2,
        width: screenSize.width,
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: <Widget>[

              Expanded(
                flex: 2,
                child: 
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('assets/images/${product.image}'),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
              ),

              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12, left: 32, right: 20, bottom: 12
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          letterSpacing: 0.8
                        ),
                      ),

                      SizedBox(height: 8,),

                      Text(
                        product.vibe,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black45,
                        ),
                      ),
                      
                      SizedBox(height: 24,),

                      Text(
                        '${product.thc} THC',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 8,),

                      Text(
                        '\$${product.priceRange}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),

      onTap: ()=> onPress(product: product),
    );
  }// Widget build(BuildContext context) { .. }
}