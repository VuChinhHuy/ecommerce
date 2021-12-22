import 'package:ecommerce/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child:  Stack(
              children: [
                Positioned(
                    child: Center(
                      child:  Material(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w)),
                          elevation: 8.0,
                          clipBehavior: Clip.antiAlias,
                          child: MaterialButton(
                              splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                              height: 42.w,
                              minWidth: 42.w,
                              onPressed: (){
                                print('click abc');
                                // ),
                              },
                              padding: EdgeInsets.all(12.w),
                              child: Icon(
                                Icons.edit,
                                color:  const Color.fromRGBO(52, 40, 62, 1.0),
                                size: 24.w,
                              )
                          )
                      ),
                    )
                ),
              ],
            ),
          ),
        ],
        toolbarHeight: 102.w,
        leading: UserProfileAvatar(
          avatarUrl: 'https://picsum.photos/id/237/5000/5000',
          avatarSplashColor: Colors.purple,
          radius: 70.w,
        ),
        leadingWidth: 90.w,
        titleSpacing: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(300.w))
        ),
        centerTitle: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Vu Chinh Huy',style: GoogleFonts.anton(fontSize: 19.t,fontWeight: FontWeight.w100,wordSpacing: 0.2,letterSpacing: 1),),
            Text('03728238283',style: TextStyle(fontSize: 14.t,letterSpacing: 1),),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.bottomLeft,
                end:  Alignment.topRight,
                colors: [
                  Color.fromRGBO(52, 40, 62, 1.0),
                  Color.fromRGBO(132, 95, 161, 1.0),
                ]
            ),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(300.w)),
          ),
        ),
      ),

      body: Container(
        padding: EdgeInsets.all( 16.w),
        child: Column(
          children: <Widget>[
            _buildItem('Shipping Addresses', Icons.location_on),
            SizedBox(height: 16.w,),
            _buildItem('Payment Methods', Icons.payments),
            SizedBox(height: 16.w,),
            _buildItem('Orders', Icons.receipt_long),
            SizedBox(height: 16.w,),
            _buildItem('Discount Cart', Icons.receipt),
            SizedBox(height: 16.w,),
            _buildItem('Favorite', Icons.favorite_border),
            SizedBox(height: 16.w,),
            _buildItem('Settings', Icons.settings),
            SizedBox(height: 16.w,),
            _buildItem('Log Out', Icons.logout),
          ],
        ),
      )
    );
  }
  Widget _buildItem(String title, IconData icon){
    return Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
        elevation: 8.0,
        clipBehavior: Clip.antiAlias,
        child: MaterialButton(
            height: 56.w,
            splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
            onPressed: (){
              print('click abc');
              // ),
            },
            padding: EdgeInsets.all(12.w),
            child: Row(
              children: [
                Icon(
                  icon,
                  color:  const Color.fromRGBO(52, 40, 62, 1.0),
                  size: 24.w,
                ),
                SizedBox(width: 12.w),
                Text(title,style: GoogleFonts.raleway(fontSize: 17.t),),
              ],
            )

        )
    );
  }
}
