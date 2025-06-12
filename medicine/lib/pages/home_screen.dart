import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medicine/network/api/url_api.dart';
import 'package:medicine/network/model/product_model.dart';
import 'package:medicine/theme.dart';
import 'package:http/http.dart' as http;
import 'package:medicine/widgets/card_category.dart';
import 'package:medicine/widgets/card_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  bool filter = false;

  List<ProductModel> listCategory = [];
  getCategory() async {
    listCategory.clear();
    var urlCategory = Uri.parse(BASEURL.categoryWithProduct);
    final response = await http.get(urlCategory);
    if (response.statusCode == 200) {
      setState(() {
        final data = jsonDecode(response.body);
        for (Map item in data) {
          listCategory.add(ProductModel.fromJson(item));
        }
      });
      getProduct();
    }
  }

  List<Product> listProduct = [];
  getProduct() async {
    listProduct.clear();
    var urlProduct = Uri.parse(BASEURL.getProduct);
    final response = await http.get(urlProduct);
    if (response.statusCode == 200) {
      setState(() {
        final data = jsonDecode(response.body);
        for (Map product in data) {
          listProduct.add(Product.fromJson(product));
        }
      });
    }
  }

  @override
  void initState() {
    getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(24, 30, 24, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/logo.png', width: 155),
                          SizedBox(height: 16),
                          Text(
                            'Find a medicine or\nvitamins with MEDHEALTH !',
                            style: regulerTextStyle.copyWith(
                              fontSize: 15,
                              color: greyBoldColor,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart, color: greenColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffe4faf0),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xffb1d8b2),
                        ),
                        hintText: 'Search Medicine...',
                        hintStyle: regulerTextStyle.copyWith(
                          color: Color(0xffb0d8b2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 32),
                      Text(
                        'Medicine & Vitamins by Category',
                        style: regulerTextStyle.copyWith(fontSize: 16),
                      ),
                      SizedBox(height: 14),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: listCategory.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, i) {
                          final x = listCategory[i];
                          return InkWell(
                            onTap: () {
                              setState(() {
                                index = i;
                                filter = true;
                                print('$index, $filter');
                              });
                            },
                            child: CardCategory(
                              imageCategory: x.image,
                              nameCategory: x.category,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 32),
                      filter
                          ? index == 7
                              ? Center(child: Text('Feature on progress'))
                              : GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: listCategory[index].product!.length,
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 16,
                                    ),
                                itemBuilder: (context, i) {
                                  final y = listCategory[index].product![i];
                                  return CardProduct(
                                    nameProduct: y.name,
                                    imageProduct: y.image,
                                    price: y.price,
                                  );
                                },
                              )
                          : GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: listProduct.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                ),
                            itemBuilder: (context, i) {
                              final y = listProduct[i];
                              return CardProduct(
                                nameProduct: y.name,
                                imageProduct: y.image,
                                price: y.price,
                              );
                            },
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
