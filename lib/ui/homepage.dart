

import 'dart:convert';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/api/category/category_bloc.dart';
import 'package:ecommerce/api/category/category_response.dart';
import 'package:ecommerce/api/product/product_bloc.dart';
import 'package:ecommerce/api/product/product_response.dart';
import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/model/category.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/wigdet/appbar.dart';
import 'package:ecommerce/wigdet/build_load.dart';
import 'package:ecommerce/wigdet/item_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> category = List.empty();
  List<Product> listProduct = List.empty();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if(!blocCategory.subject.isClosed){
        blocCategory.getCategory();
      }
      if(!blocCategory.subject.isClosed){
        blocProduct.getProduct();
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    blocProduct.dispose();
    blocCategory.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer:  StreamBuilder<CategoryResponse>(
        stream: blocCategory.subject.stream,
        builder: (context, AsyncSnapshot<CategoryResponse> snapshot){
          if(snapshot.hasData){
            List<Category> categories = snapshot.data!.list;
            category = categories.where((element) => element.parent == null && element.deleted == false).toList();
            return buildDrawer(category);
          }
          else {
            return buildLoadingWidget();
          }
        },
      ),
      body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 16.w) ,
                    width: double.infinity,
                    child: BannerCarousel(
                      banners: [
                        BannerModel(imagePath: 'https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center', id: '1'),
                        BannerModel(imagePath: 'https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center',id: '2'),
                        BannerModel(imagePath: 'https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center',id: '3'),
                      ],
                      onTap: (id) => print(id),
                      activeColor: Colors.amberAccent,
                      disableColor: Colors.black12,
                      animation: true,
                      width: 375.w,
                      height: 88.w,
                      // customizedBanners: [
                      //   Image.network('https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center',
                      //     width: 343.w,
                      //     height: 88.w,),
                      //   Stack(
                      //     children: [
                      //       Image.network('https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center',
                      //         width: 343.w,
                      //         height: 88.w,
                      //       ),
                      //       Container(
                      //         padding: EdgeInsets.fromLTRB(18.w, 14.w, 0, 0),
                      //         child: Text('Fashion Sale',style: TextStyle(color: Colors.purple),),
                      //       ),
                      //     ],
                      //   )
                      // ],
                    ),
                  ),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Expanded(child: Text('Catalogue',style: GoogleFonts.mukta(fontWeight: FontWeight.bold,fontSize: 19.t),)),
                  //     MaterialButton(onPressed: (){},
                  //         height: 23.w,
                  //         child: Text('See all')),
                  //   ],
                  // ),
                  // // build Category
                  //  StreamBuilder<CategoryResponse>(
                  //     stream: blocCategory.subject.stream,
                  //     builder: (context, AsyncSnapshot<CategoryResponse> snapshot){
                  //       if(snapshot.hasData){
                  //         List<Category> categories = snapshot.data!.list;
                  //         category = categories.where((element) => element.icon.toString().contains('null')==false).toList();
                  //         return Container(
                  //             height: 100.w,
                  //             width: double.infinity,
                  //             padding: EdgeInsets.all(8.w),
                  //             child: _builListCategory()
                  //         );
                  //       }
                  //       else {
                  //         return buildLoadingWidget();
                  //       }
                  //     },
                  //   ),
                  Text('Featured',style: GoogleFonts.mukta(fontWeight: FontWeight.bold,fontSize: 19.t),),
                ],
              ),
            ),
            StreamBuilder<ProductResponse>(stream: blocProduct.subject.stream,
              builder: (context, AsyncSnapshot<ProductResponse> snapshot){
                print(snapshot.data);
                if(snapshot.hasData){
                  listProduct = snapshot.data!.list;
                  List<Product> proudct = listProduct.where((e) => e.deleted == false).toList();
                  proudct.take(100);
                  return _buildGirdView(proudct);
                }
                else
                  return buildLoadingWidget();
              },
            )
          ],
        )
      )
      )
    );
  }

  Widget _buildGirdView(List<Product> product)=>GridView.builder(
      itemCount: product.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics:  const NeverScrollableScrollPhysics(),
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
  Widget _builListCategory()=>ListView.builder(
    itemCount: category.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index){
        return Container(
          width: 100.w,
          height: 100.w,
          padding: EdgeInsets.only(right: 12.w),
          child:
          Column(
          children: [
            Image.network('http://khoaluantotnghiep.tk/backend/assets/dist/images/categories/${category[index].icon!}',
            height: 50.w,
            width: 50.w),
             Text('${category[index].name}',maxLines: 2,textAlign: TextAlign.center),
          ],
        )
        );
      });
}
