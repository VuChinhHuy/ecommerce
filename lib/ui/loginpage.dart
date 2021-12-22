import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/ui/forgotpasswordpage.dart';
import 'package:ecommerce/ui/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void navigationToForgotPassword(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
  }
  void navigationToMain(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Main()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(8.w, 44.w, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  const IconData(61059, fontFamily: 'MaterialIcons'),
                  color: Colors.black,
                  size: 24.w,
                ),
                SizedBox(height: 30.w,),
                Container(
                  padding: EdgeInsets.fromLTRB(6.w, 0, 0, 0),
                  child: Text('Login',
                    style: GoogleFonts.metrophobic(fontSize: 34.t,fontWeight: FontWeight.bold),),
                )

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16.w, 73.w, 16.w, 0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                SizedBox(height: 8.w),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(155.w, 16.w, 0.0, 0) ,
            child: GestureDetector(
              onTap: navigationToForgotPassword,
              child: Row(
                children: [
                  Text('Forgot your password?',
                      style: GoogleFonts.metrophobic(fontSize: 14.t,color: Colors.black,letterSpacing: 0.3)),
                  SizedBox(width: 4.w),
                  Icon(
                    const IconData(57503, fontFamily: 'MaterialIcons'),
                    color: Colors.red,
                    size: 24.w,
                  )
                ],
              ),
            )

          ),
          Container(
              padding: EdgeInsets.fromLTRB(16.w, 28.w, 16.w, 0),
              child: Material(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48.w)),
                  elevation: 8.0,
                  color: Colors.green,
                  clipBehavior: Clip.antiAlias,
                  child: MaterialButton(
                    onPressed: navigationToMain,
                    color: Colors.green,
                    height: 48.w,
                    minWidth: double.infinity,
                    textColor: Colors.white,
                    child: Text('LOGIN',style: GoogleFonts.metrophobic(fontSize: 14.t)),
                  )
              )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 194.w, 0.0, 0.0),
            child: Text('Or sign up with social account',
                style: GoogleFonts.metrophobic(fontSize: 14.t,color: Colors.black,letterSpacing: 0.3)),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 12.w, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Material(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w)),
                    elevation: 8.0,
                    clipBehavior: Clip.antiAlias,
                    child: MaterialButton(
                        onPressed: (){},
                        color: Colors.white,
                        height: 64.w,
                        minWidth: 64.w,
                        child: Icon(
                          IconData(58062, fontFamily: 'MaterialIcons'),
                          color: Colors.red,
                          size: 30.w,
                        )
                    )
                ),
                SizedBox(width: 16.w),
                Material(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w)),
                    elevation: 8.0,
                    clipBehavior: Clip.antiAlias,
                    child: MaterialButton(
                        onPressed: (){},
                        color: Colors.white,
                        height: 64.w,
                        minWidth: 64.w,
                        child: Icon(
                          IconData(57941, fontFamily: 'MaterialIcons'),
                          color: Colors.indigoAccent,
                          size: 30.w,
                        )
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
