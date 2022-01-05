

import 'dart:convert';

import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/model/acount.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pbkdf2ns/pbkdf2ns.dart';
import 'package:crypto/crypto.dart';

class SigupProfilePage extends StatefulWidget {
  final Account account;
  const SigupProfilePage({Key? key,required this.account}) : super(key: key);

  @override
  _SigupProfilePageState createState() => _SigupProfilePageState();
}

class _SigupProfilePageState extends State<SigupProfilePage> {
  late Account account;
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    account = widget.account;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(8.w, 44.w, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                SizedBox(height: 30.w,),
                Container(
                  padding: EdgeInsets.fromLTRB(6.w, 0, 0, 0),
                  child: Text('Fill full the information',
                    style: GoogleFonts.metrophobic(fontSize: 34.t,fontWeight: FontWeight.bold),),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16.w, 73.w, 16.w, 0),
                  child: Column(
                    children: [
                      TextField(
                        controller: fullNameController,
                        decoration: InputDecoration(
                          hintText: 'Full name',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      SizedBox(height: 8.w),
                      TextField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      SizedBox(height: 8.w),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(16.w, 28.w, 16.w, 0),
                    child: Material(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48.w)),
                        elevation: 8.0,
                        clipBehavior: Clip.antiAlias,
                        child: MaterialButton(
                            onPressed: (){
                              var pass ="seller";
                              var salt ="3bad222d57c2b18dd20c7bf41f472f12";
                              var salted = pass + salt;
                              var bytes = utf8.encode(salted);
                              print(base64Decode("4zVo7tvTy6DvN1kMzmCLqQPA1GVT38VgkPgKjjefmUR25olI33+D6mCRC4QhmttBctevBG7/spttnooro9JstQ=="));
                              var hash = sha512.convert(bytes);
                              var hashed = base64Encode(utf8.encode(hash.toString()));
                              print(hash);

                            },
                            color: const Color.fromRGBO(52, 40, 62, 0.9),
                            height: 48.w,
                            minWidth: double.infinity,
                            textColor: Colors.white,
                            child: Text('S I G N U P',style: GoogleFonts.metrophobic(fontSize: 14.t,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),

                        )
                    )

              ],
            ),
          ),

        ],
      ),

    );
  }

}

