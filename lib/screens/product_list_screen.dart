import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppinglist_app_provider/provider/product_notifier.dart';

class ProductListScreen extends StatefulWidget {

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  Widget build(BuildContext context) {


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
        itemCount: context.watch<ProductNotifier>().productList.length,
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
                    Consumer<ProductNotifier>(builder: (_,notifier,__)=>Text(notifier.productList[index].name, style: TextStyle(color: Colors.white)),),
                    SizedBox(width: 10.0),
                    Consumer<ProductNotifier>(builder: (_,notifier,__)=>Text(notifier.productList[index].amount, style: TextStyle(color: Colors.white)),),
                  ],
                ),
                Consumer<ProductNotifier>(builder: (_,notifier,__)=>IconButton(
                  icon: Icon(Icons.delete, color: Colors.white,),
                  onPressed: (){
                    notifier.deleteProduct(index);
                  },
                )),
              ],
            ),
          ),
        ),),
    );
  }


}

