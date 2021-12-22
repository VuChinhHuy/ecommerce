import 'package:ecommerce/dimens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                  IconData(61059, fontFamily: 'MaterialIcons'),
                  color: Colors.black,
                  size: 24.w,
                ),
                SizedBox(height: 30.w,),
                Container(
                  padding: EdgeInsets.fromLTRB(6.w, 0, 0, 0),
                  child: Text('Forgot Password',
                    style: GoogleFonts.metrophobic(fontSize: 34.t,fontWeight: FontWeight.bold),),
                )

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15.w, 87.w, 15.w, 0.0),
            child: Text('Please, enter your email address. You will receive a link to create a new password via email.'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(16.w, 55.w, 16.w, 0),
              child: Material(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48.w)),
                  elevation: 8.0,
                  color: Colors.green,
                  clipBehavior: Clip.antiAlias,
                  child: MaterialButton(
                    onPressed: (){},
                    color: Colors.green,
                    height: 48.w,
                    minWidth: double.infinity,
                    textColor: Colors.white,
                    child: Text('SEND',style: GoogleFonts.metrophobic(fontSize: 14.t)),
                  )
              )
          ),
        ],
      ),
    );
  }
}
