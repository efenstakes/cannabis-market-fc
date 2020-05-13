import 'package:flutter/material.dart';
import 'package:weed_market/models/product.dart';


class ProductDetail extends StatefulWidget {
  Product product;

  ProductDetail({ this.product });

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Product _product;

  @override
  void initState() {
    super.initState();

    _product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      
      backgroundColor: Color(0xfffe9f1f1),

      body: Container(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[


            SizedBox(height: screenSize.height*0.1,),

            Container(
              height: screenSize.height*0.8,
              margin: EdgeInsets.only(
                left: 24, right: 24,
              ),
              decoration: BoxDecoration(
                color: _product.backgroundColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(40),

                boxShadow: [
                  // BoxShadow(
                  //   color: _product.backgroundColor.withOpacity(0.5),
                  //   blurRadius: 0,
                  //   spreadRadius: 0,
                  // ),
                ]
              ),
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[

                  // rating 
                  Positioned(
                    top: 20,
                    left: 20,
                    child: _buildRatingAndName(
                      context: context,
                      product: _product,
                    ),
                  ),

                  // image
                  Positioned(
                    right: -20,
                    top: -32,
                    child: _buildProductImage(
                      product: _product,
                      context: context,
                    ),
                  ),

                  // food details
                  Positioned(
                    right: 8,
                    top: screenSize.height*0.38,
                    left: 0,
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          
                          _buildTHCDetails(
                            context: context, product: _product
                          ),

                        ],
                      ),
                    ),
                  ),
                  
                  // food details
                  Positioned(
                    right: 8,
                    left: 0,
                    bottom: 40,
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          
                          _buildPurchaseSection(
                            context: context, product: _product
                          ),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            
            Container(
              height: screenSize.height*0.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: FloatingActionButton.extended(
                      icon: Icon(
                        Icons.close,
                        color: Colors.black54
                      ),
                      label: Text(
                        'Close',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      elevation: 0,
                      backgroundColor: Color(0xfffe9f1f1),                
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      
    );
  }// Widget build(BuildContext context) { .. }


  Widget _buildRatingAndName({ Product product, BuildContext context }) {

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           
          _buildStarRating(),

          SizedBox(height: 64),

          ...product.name.split(" ").map((String name) {

            return Text(
              name,
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w700,
                // color: Color(0xffD3E5E2),
                color: Colors.black.withOpacity(0.7),
                letterSpacing: 1
              ),
            );
          }).toList(),

          SizedBox(height: 40),

          Text(
            product.type,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              // color: Color(0xffD3E5E2),
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 12),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                // color: Color(0xffD3E5E2),
                color: Colors.black54,
                letterSpacing: 1
              ),
              children: [

                TextSpan(
                  text: 'Vibe ',
                ),
                
                TextSpan(
                  text: product.vibe,
                ),
 
              ]
            ),
          ),
          // Text(
          //   'Vibe ${product.vibe}',
          //   style: TextStyle(
          //     fontSize: 24,
          //     fontWeight: FontWeight.w600,
          //     color: Color(0xffD3E5E2),
          //     letterSpacing: 1
          //   ),
          // ),
          // SizedBox(height: 20),
          // RichText(
          //   text: TextSpan(
          //     style: TextStyle(
          //       fontSize: 24,
          //       fontWeight: FontWeight.w600,
          //       color: Color(0xffD3E5E2),
          //       letterSpacing: 1
          //     ),
          //     children: [

          //       TextSpan(
          //         text: 'Vibe ',
          //       ),
                
          //       TextSpan(
          //         text: product.vibe,
          //       ),
 
          //     ]
          //   ),
          // ),
          
        
        ],
      )
    );
  }// Widget _buildRatingAndName() { .. }

  Widget _buildStarRating() {

    return Container(
      decoration: BoxDecoration(
        color: Color(0xfffD3E5E2),
        borderRadius: BorderRadius.circular(16)
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16, vertical: 8,
      ),
      child: Row(
        children: <Widget>[

          Icon(
            Icons.star,
            color: _product.backgroundColor,
          ),
          SizedBox(width: 4),
          Text(
            '4.5',
            style: TextStyle(
              color: _product.backgroundColor,
            )
          ),

        ],
      ),
    );
  }// Widget _buildStarRating() { .. }

  Widget _buildProductImage({ Product product, BuildContext context}) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      // height: screenSize.height*0.3,
      // width: screenSize.width*0.5,
      height: screenSize.height*0.4,
      width: screenSize.height*0.4,
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            blurRadius: 4,
            spreadRadius: 3,
          )
        ]
      ),
      child: ClipOval(
        child: Image(
          image: AssetImage('assets/images/${product.image}'),
          fit: BoxFit.cover,
          height: screenSize.height*0.4,
          width: screenSize.height*0.4,
        ),
      ),
      // child: ClipRRect(
      //   child: Image(
      //     image: AssetImage('assets/images/${product.image}'),
      //     fit: BoxFit.cover,
      //   ),
      //   borderRadius: BorderRadius.circular(16)
      // )
    );
  }// Widget _buildProductImage({ Product product, BuildContext context}) { .. }

  Widget _buildTHCDetails({ Product product, BuildContext context }) {
    Size screenSize = MediaQuery.of(context).size;
 
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            
            Container(
              width: screenSize.width*0.6,
              height: screenSize.height*0.24,
              decoration: BoxDecoration(
                color: product.backgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.only(
                left: 20, top: 24,
              ),
              child: _buildTerpenesDetails(
                product: product,
              ),
            ),

            SizedBox(width: 40),
            
            Container(
              width: screenSize.width*0.4,
              height: screenSize.height*0.2,
              padding: EdgeInsets.only(
                left: 56, top: 36,
              ),
              decoration: BoxDecoration(
                color: product.backgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: _buildTHCDetail(
                product: product,
              ),
            ),

          ],
        ),
      ),
    );
  }// Widget _buildTHCDetails({ Product product, BuildContext context }) { .. }
  
  Widget _buildPurchaseSection({ @required Product product, @required BuildContext context }) {
    Size screenSize = MediaQuery.of(context).size;
 
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          // more details
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 20, horizontal: 56,
            ),
            decoration: BoxDecoration(
              // color: Color(0xfffD3E5E2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 2,
                color: Color(0xfffD3E5E2),
              )
            ),
            child: Center(
              child: Text(
                'More',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xfffD3E5E2),
                  letterSpacing: 1,
                ),
              ),
            ),
          ),


          // buy now
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 20, horizontal: 56,
              ),
              decoration: BoxDecoration(
                color: Color(0xfffD3E5E2),
                borderRadius: BorderRadius.circular(16)
              ),
              child: Center(
                child: Row(
                  children: <Widget>[
                    
                    Icon(
                      Icons.add_shopping_cart,
                      size: 28,
                    ),

                    SizedBox(width: 16),

                    Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),

                  ],
                ),
              ),
            ),
            onTap: (){},
          ),

        ],
      ) 
    );
  }// Widget _buildPurchaseSection({ @required Product product, @required BuildContext context }) { .. }
  

  Widget _buildTerpenesDetails({ Product product }) {

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          Text(
            'Terpenes',
            style: TextStyle(
              fontSize: 26,
              color: Color(0xfffD3E5E2),
            ),
          ),
          SizedBox(height: 40),
          
          _buildTerpeneDetail(
            title: 'Herbal', width: 200, color: Color(0xfff796889)
          ),
          SizedBox(height: 20),
          _buildTerpeneDetail(
            title: 'Pine', width: 80, color: Color(0xfff75A3A5)
          ),
          SizedBox(height: 20),
          _buildTerpeneDetail(
            title: 'Pappery', width: 40, color: Color(0xfff939053)
          ),

        ],
      ),
    );
  }// Widget _buildTerpenesDetails({ Product product }) { .. }

  Widget _buildTerpeneDetail({ 
    @required String title, @required Color color,
    @required double width }) {

    return Container(
      child: Row(
        children: <Widget>[

          Container(
            width: 120,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xfffD3E5E2),
                letterSpacing: 1.2
              ),
            ),
          ),

          SizedBox(width: 8),
 
          Container(
            width: width,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color,
            ),
          ),

        ],
      ),
    );
  }// Widget _buildTerpeneDetail({ String title, Color color, double width }) { .. }
  

  Widget _buildTHCDetail({ Product product }){

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          Text(
            'Cannabinoids',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xfffD3E5E2),
              letterSpacing: 1.2
            ),
          ),
          SizedBox(height: 20),

          Row(
            children: <Widget>[
              
              Text(
                product.thc,
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.w600,
                  color: Color(0xfffD3E5E2),
                  letterSpacing: 1.2
                ),
              ),
              SizedBox(width: 12),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  Text(
                    '%',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xfffD3E5E2).withOpacity(0.6),
                      letterSpacing: 1.2
                    ),
                  ),

                  Text(
                    'THC',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xfffD3E5E2),
                      letterSpacing: 1.2
                    ),
                  ),

                ],
              )

            ],
          ),

        ],
      ),
    );
  }// Widget _buildTHCDetail({ Product product }){ .. }


}