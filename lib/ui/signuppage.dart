import 'package:ecommerce/model/acount.dart';
import 'package:ecommerce/ui/loginpage.dart';
import 'package:ecommerce/ui/signup_customer_page.dart';
import 'package:ecommerce/wigdet/text_field_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

class SigupPage extends StatefulWidget {
  const SigupPage({Key? key}) : super(key: key);

  @override
  _SigupPageState createState() => _SigupPageState();
}

class _SigupPageState extends State<SigupPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool likePass = true;
  bool visiblePass = false;

  void navigationToLogin(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    usernameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          // Signup title
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(8.w, 44.w, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.w,),
                Container(
                  padding: EdgeInsets.fromLTRB(6.w, 0, 0, 0),
                  child: Text('Sign up',
                    style: GoogleFonts.metrophobic(fontSize: 35.t,fontWeight: FontWeight.bold),),
                )

              ],
            ),
          ),
          //Text Field
          Container(
            padding: EdgeInsets.fromLTRB(16.w, 73.w, 16.w, 0),
            child: Column(
              children: [
                TextFieldContainer(
                    child: TextField(
                      style: GoogleFonts.raleway(fontSize: 19.t,color: Colors.white),
                      controller: usernameController,
                      decoration: const InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        icon: Icon(Icons.person,color: Colors.white,),
                      ),
                    )),
                SizedBox(height: 8.w),
                TextFieldContainer(
                    child: TextField(
                      style: GoogleFonts.raleway(fontSize: 19.t,color: Colors.white),
                      controller: passwordController,
                      obscureText: visiblePass,
                      decoration:  InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                visiblePass = !visiblePass;
                              });
                            },
                            icon: Icon(visiblePass ? Icons.visibility : Icons.visibility_off,
                              color: Color.fromRGBO(52, 40, 62, 1.0),)),
                        hintStyle: const TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        icon: const Icon(Icons.password,color: Colors.white,),
                      ),
                    )),
                SizedBox(height: 8.w),
                TextFieldContainer(
                    child: TextField(
                      onChanged: (text){
                        setState(() {
                          text == passwordController.text ? likePass = true: likePass = false;
                        });
                      },
                      style: GoogleFonts.raleway(fontSize: 19.t,color: likePass ? Colors.white : Colors.red),
                      obscureText: visiblePass,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        suffixIcon:IconButton(
                            onPressed: (){
                              setState(() {
                                visiblePass = !visiblePass;
                              });
                            },
                            icon: Icon(visiblePass ? Icons.visibility : Icons.visibility_off,
                              color: Color.fromRGBO(52, 40, 62, 1.0),)),
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        icon: Icon(Icons.flip_camera_android,
                          color: likePass ? Colors.white : Colors.red,),
                      ),
                    )),
              ],
            ),
          ),
          // already have a account >>
          Container(
            padding: EdgeInsets.fromLTRB(155.w, 16.w, 0.w, 0) ,
            child:  GestureDetector(
              onTap: navigationToLogin,
              child:Row(
                children: [
                  Text('Already have an account?',
                      style: GoogleFonts.metrophobic(fontSize: 14.t,color: Colors.black,letterSpacing: 0.3)),
                  SizedBox(width: 4.w),
                  Icon(
                    IconData(57503, fontFamily: 'MaterialIcons'),
                    color: Colors.red,
                    size: 24.w,
                  )
                ],
              ),
            )

          ),
          //Button Continue
          Container(
            padding: EdgeInsets.fromLTRB(16.w, 28.w, 16.w, 0),
            child: Material(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48.w)),
              elevation: 8.0,
              clipBehavior: Clip.antiAlias,
              child: MaterialButton(
                  onPressed: (){
                    if(likePass){
                      if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty ) {
                        Account account = Account(
                            username: usernameController.text,
                            password: passwordController.text);
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                SigupProfilePage(account: account,)));
                      }
                      else{
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              contentPadding: EdgeInsets.zero,
                              content: Container(
                                color: Colors.amber,
                                padding: EdgeInsets.all(16.w),
                                child: Text('Please fill full information !!!',style: GoogleFonts.metrophobic(color: Colors.white,fontSize: 19.t),),
                              ),
                            );
                          },
                        );
                      }
                    }
                  },
                  color: const Color.fromRGBO(52, 40, 62, 0.9),
                  height: 48.w,
                  minWidth: double.infinity,
                  textColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(child:
                      Text('C O N T I N U E',style: GoogleFonts.metrophobic(fontSize: 14.t,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                      SizedBox(width: 8.w,),
                      Icon(Icons.trending_flat,
                        size: 24.w,
                      )
                    ],
                  )

                )
            )
          ),

          Container(
            padding: EdgeInsets.fromLTRB(0.0, 126.w, 0.0, 0.0),
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
                        const IconData(58062, fontFamily: 'MaterialIcons'),
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
                        const IconData(57941, fontFamily: 'MaterialIcons'),
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
