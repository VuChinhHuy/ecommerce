

import 'dart:convert';
import 'dart:io';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/model/category.dart';
import 'package:ecommerce/utils/rest_client.dart';
import 'package:ecommerce/wigdet/appbar.dart';
import 'package:ecommerce/wigdet/item_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> category = List.empty();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategory();
  }

  getCategory() async{
    RestClient().init('http://khoaluantotnghiep.tk/api/categories');
    Dio _dio = RestClient.getDio();

    Response response = await _dio
        .get(_dio.options.baseUrl,
        options: Options(
            headers: {'Content-Type': 'application/json'},
            contentType: 'application/json',
            ));

    // category = (r.data as List).map((e) => Category.fromJson(e)).toList();
    print(response.requestOptions.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: Text('Catalogue',style: GoogleFonts.mukta(fontWeight: FontWeight.bold,fontSize: 19.t),)),
                      MaterialButton(onPressed: (){},
                          height: 23.w,
                          child: Text('See all')),
                    ],
                  ),
                  Container(
                    height: 70.w,
                    width: double.infinity,
                    padding: EdgeInsets.all(10.w),
                    child: _builListCategory(),
                  ),
                  Text('Featured',style: GoogleFonts.mukta(fontWeight: FontWeight.bold,fontSize: 19.t),),
                ],
              ),
            ),
            Container(
              child: _buildGirdView(),
            )
          ],
        )
      )
      )
    );
  }

  Widget _buildGirdView()=>GridView.builder(
      itemCount: 100,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 4.0,
          mainAxisExtent: 300,
      ),
      itemBuilder: (BuildContext context, int index){
        return const Center(
          child: ProductCart(isFavorite: false),
        );
      },
  );
  Widget _builListCategory()=>ListView.builder(
    itemCount: category.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index){
        return Column(
          children: [
            Image.network('http://khoaluantotnghiep.tk/backend/assets/dist/images/category/${category[index].icon}',
            height: 50.w,
            width: 50.w),
            Text('${category[index].name}'),
          ],
        ); 
      });
}
