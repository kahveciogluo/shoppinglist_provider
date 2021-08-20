import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppinglist_app_provider/models/product.dart';
import 'package:shoppinglist_app_provider/provider/product_notifier.dart';

class ProductListScreen extends StatefulWidget {
  List<Product> productList;
  ProductListScreen(this.productList);


  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  //deleteProduct(int index){
    //setState(() {
      //widget.productList.removeAt(index);
    //});

  @override
  Widget build(BuildContext context) {
    ProductNotifier productNotifier = Provider.of<ProductNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product List",
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: productNotifier.productList.length,
        itemBuilder: (BuildContext context, int index) => Card(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(productNotifier.productList[index].name, style: TextStyle(color: Colors.white)),
                    SizedBox(width: 10.0),
                    Text(productNotifier.productList[index].amount, style: TextStyle(color: Colors.white)),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.white,),
                  onPressed: (){
                    productNotifier.deleteProduct(index);
                      //deleteProduct(index);
                  },
                )
              ],
            ),
          ),
        ),),
    );
  }


}

