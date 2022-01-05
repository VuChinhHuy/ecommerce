import 'package:ecommerce/api/category/category_bloc.dart';
import 'package:ecommerce/api/category/category_response.dart';
import 'package:ecommerce/api/product/product_bloc.dart';
import 'package:ecommerce/api/product/product_response.dart';
import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/model/category.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/wigdet/build_load.dart';
import 'package:ecommerce/wigdet/item_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

class ProductInCategory extends StatefulWidget {
  final Category category;
  const ProductInCategory({Key? key,required this.category}) : super(key: key);

  @override
  _ProductInCategoryState createState() => _ProductInCategoryState();
}

class _ProductInCategoryState extends State<ProductInCategory> {
  List<Product> listProduct = List.empty();
  List<Product> productFill = List.empty();
  List<String> categoryTittle = List.empty();
  List<Category> listCategory = [];
  bool acctionSearch = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryTittle = [];
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    blocCategory.dispose();
    categoryTittle.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: acctionSearch ?
        TextField(
          autofocus: true,
          onChanged: (text){
            setState(() {
              productFill = listProduct.where((element) => element.name?.toLowerCase().contains(text)==true).toList();
              print(productFill);
            });

          },
          style: TextStyle(color: Colors.white,fontSize: 19.t),
          decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.white,fontSize: 19.t),
              contentPadding: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
          ),
        ) :
        Text('${widget.category.name}',style: GoogleFonts.metrophobic(fontSize: 19.t,fontWeight: FontWeight.bold)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient:  LinearGradient(
                begin: Alignment.bottomLeft,
                end:  Alignment.topRight,
                colors: [
                  Color.fromRGBO(52, 40, 62, 1.0),
                  Color.fromRGBO(132, 95, 161, 1.0),
                ]
            ),

          ),
        ),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              acctionSearch = !acctionSearch;
              if(acctionSearch){
                productFill =[];
              }
            });

          }, icon: acctionSearch? Icon(Icons.close): Icon(Icons.search))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50.w,
            child: StreamBuilder<CategoryResponse>(
                stream: blocCategory.subject.stream,
                builder: (context,AsyncSnapshot<CategoryResponse> snap){
                  if(snap.hasData){
                     listCategory = snap.data!.list;
                     List<Category> list = listCategory.where((element) => element.parent != null && Category.fromJson(element.parent).id== widget.category.id).toList();
                     print(list.length);
                     if(list.isNotEmpty){
                       return _buildCategoryChild(list);
                     }
                  }else if(snap.hasError){
                    buildErrorWidget(snap.error.toString());
                  }
                    return buildLoadingWidget();
                }),
          ),
          Expanded(child: acctionSearch?
          _buildGirdView(productFill)
          : StreamBuilder<ProductResponse>(stream: blocProduct.subject.stream,
            builder: (context, AsyncSnapshot<ProductResponse> snapshot){
              if(snapshot.hasData){
                listProduct = snapshot.data!.list;
                return Container(
                  height: 80.w,
                  width: double.infinity,
                  color: Colors.black12,
                  padding: EdgeInsets.all(8.w),
                  child: _buildGirdView(listProduct),
                );
              }
              else
                return buildLoadingWidget();
            },
          )),
        ],
      )

    );
  }
  Widget _buildGirdView(List<Product> product)=>GridView.builder(
    itemCount: product.length,
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 5.w,
      mainAxisSpacing: 4.0.w,
      mainAxisExtent: 300.w,
    ),
    itemBuilder: (BuildContext context, int index){
      return Center(
        child: ProductCart(product: product[index],isFavorite: false,),
      );
    },
  );

  Widget _buildCategoryChild(List<Category> list){
    list.forEach((element) {
      categoryTittle.add(element.name.toString());
    });
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
        scrollDirection: Axis.horizontal,
        children: [
        GroupButton(
          buttons: categoryTittle,
          selectedTextStyle: GoogleFonts.metrophobic(fontSize: 14.t),
          unselectedTextStyle: GoogleFonts.metrophobic(fontSize: 14.t),
          unselectedColor: const Color.fromRGBO(132, 95, 161, 1.0),
          selectedColor: const Color.fromRGBO(52, 40, 62, 1.0),
          borderRadius: BorderRadius.circular(15.w),
          onSelected: (int index, bool isSelected) {  },)
        ],
    );
  }
}
