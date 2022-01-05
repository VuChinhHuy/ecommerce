

import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/model/category.dart';
import 'package:ecommerce/ui/product_in_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

buildAppBar(){
  return  PreferredSize(
    preferredSize: Size(
        screenWidth,
        90.w
    ),
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end:  Alignment.topRight,
                  colors: [
                    Color.fromRGBO(52, 40, 62, 1.0),
                    Color.fromRGBO(132, 95, 161, 1.0),
                  ]
              ),
            ),
            child: AppBar(
              toolbarHeight: 24,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text('OGANI',textAlign: TextAlign.center,style: GoogleFonts.metrophobic(fontSize: 18.t,color: Colors.white,fontWeight: FontWeight.bold )),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.menu),
                    onPressed: () { Scaffold.of(context).openDrawer(); },
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
              actions: const [
                Padding(padding: EdgeInsets.only(right: 16.0),
                    child: Icon(Icons.notifications_none,
                        size: 24)
                )
              ],
            )
        ),
        Positioned(
            bottom: 0.w,
            right: 0.w,
            child: Container(
              color: Colors.white,
              height: 22.w,
              width: 375.w,
            )
        ),
        Positioned(
          left: 22.w,
          bottom: 2.w,
          child: Container(
            height: 44.w,
            width: 325.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(132, 95, 161, 1.0),
                  blurRadius: 25,
                  offset: Offset(1,5),
                )],
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: const Icon(Icons.search),
                  ),
                  hintText: 'Search',
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Colors.white, width: 0.0)),
                  contentPadding: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                  focusedBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Colors.white, width: 0.0))

              ),
            ),
          ),
        ),

      ],
    ),
  );

}

buildSuccess(){
  return Center(
    heightFactor: 360.w,
    child: Container(
      height: 360.w,
      width: 327.w,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:  [
          BoxShadow(
          color: const Color.fromRGBO(132, 95, 161, 1.0),
          blurRadius: 15.w,
          offset: Offset(1.w,5.w),
        )],
        borderRadius: BorderRadius.circular(20.w)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 112.w,
                width: 310.w,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end:  Alignment.topRight,
                      colors: [
                        Color.fromRGBO(52, 40, 62, 1.0),
                        Color.fromRGBO(132, 95, 161, 1.0),
                      ]
                  ),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(310.w),bottomLeft:Radius.circular(310.w))
                ),

              ),
              Positioned(
                top: 24.w,
                  left: 125.w,
                  child: Icon(
                      Icons.check_circle,
                    color: Colors.white,
                    size: 64.w
                  ))
            ],
          ),
          SizedBox(height: 16.w,),
          Text('Success',textAlign: TextAlign.center,style: GoogleFonts.metrophobic(fontSize: 25.t,
              fontWeight: FontWeight.bold,
              color: const Color.fromRGBO(52, 40, 62, 1.0))),
          SizedBox(height: 12.w,),
          Text('Your order will be delivered soon.\nIt can be tracked in the "Orders" section.',textAlign: TextAlign.center,style: GoogleFonts.metrophobic(fontSize: 14.t,
              color: const Color.fromRGBO(52, 40, 62, 1.0))),
          SizedBox(height: 24.w),
          Material(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
              elevation: 8.0,
              clipBehavior: Clip.antiAlias,
              child: MaterialButton(
                  height: 48.w,
                  minWidth: 243.w,
                  color: Colors.amber,
                  splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                  onPressed: (){
                    print('click abc');
                    // ),
                  },
                  padding: EdgeInsets.all(12.w),
                  child: Text('Continue Shopping',textAlign: TextAlign.center,style: GoogleFonts.metrophobic(fontSize: 17.t,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))

              )
          ),
          SizedBox(height: 24.w),
          MaterialButton(
              height: 48.w,
              minWidth: 243.w,
              splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
              onPressed: (){
                print('click abc');
                // ),
              },
              padding: EdgeInsets.all(12.w),
              child: Text('Go to Orders',textAlign: TextAlign.center,style: GoogleFonts.metrophobic(fontSize: 17.t,
              ))

          ),


        ],
      ),
    ),
  );
}

buildDrawer(List<Category> category){
  return Drawer(
    child:
    Column(
      children: [
        DrawerHeader(
          child: Image.network('http://khoaluantotnghiep.tk/frontend/assets/img/logo.png'),
        ),
        Expanded(
        child:
        ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: category.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index){
            return ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductInCategory(category: category[index])));

              },
              title: Text(category[index].name!,style: GoogleFonts.metrophobic(fontSize: 19.t),),
            );
            }))
      ],
    )
  );
}