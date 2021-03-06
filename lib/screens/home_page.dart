import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppinglist_app_provider/models/product.dart';
import 'package:shoppinglist_app_provider/provider/product_notifier.dart';
import 'package:shoppinglist_app_provider/screens/product_list_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _name;
  String? _amount;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Shopping List",
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                context.watch<ProductNotifier>().numberOfProducts.toString(),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 140.0,
              child: Form(
                key: this._formKey,
                child: ListView(
                  children: [
                    buildProductNameInput(),
                    SizedBox(height: 10.0),
                    buildProductAmountInput(),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    elevation: 8,
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    _formKey.currentState!.save();
                    context.read<ProductNotifier>().addProduct(Product(name: _name!, amount: _amount!));
                  },
                ),
                SizedBox(width: 10.0),
                TextButton(
                  style: TextButton.styleFrom(
                    elevation: 8,
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: Text(
                    'List',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductListScreen()));
                  },
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
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
                            Text(context.watch<ProductNotifier>().productList[index].name, style: TextStyle(color: Colors.white)),
                            SizedBox(width: 10.0),
                            Text(context.watch<ProductNotifier>().productList[index].amount, style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      IconButton(
                      icon: Icon(Icons.delete, color: Colors.white,),
                      onPressed: (){
                        context.read<ProductNotifier>().deleteProduct(index);
                      },
                    ),
                      ],
                    ),
                  ),
                ),),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildProductNameInput() {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            )),
        labelText: 'Product Name',
        labelStyle:
            TextStyle(fontSize: 14.0, color: Theme.of(context).primaryColor),
        hintText: 'Ex: lettuce, milk',
        hintStyle: TextStyle(fontSize: 12.0),
      ),
      onSaved: (String? value) {
        _name = value!;
      },
    );
  }

  Widget buildProductAmountInput() {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            )),
        labelText: 'Product Amount',
        labelStyle:
            TextStyle(fontSize: 14.0, color: Theme.of(context).primaryColor),
        hintText: 'Ex: 1 kg, 3 pieces',
        hintStyle: TextStyle(fontSize: 12.0),
      ),
      onSaved: (String? value) {
        _amount = value!;
      },
    );
  }
}
