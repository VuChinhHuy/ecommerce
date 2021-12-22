import 'package:ecommerce/dimens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Out',style: GoogleFonts.sansita(fontSize: 19.t)),
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
      ),
      bottomSheet: _buildBottomSheet(),
      body: _buildBody(),
    );
  }
  // Build Bottom Sheet
  _buildBottomSheet(){
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w)),
      elevation: 8.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: EdgeInsets.all(16.w),
        height: 202.w,
        color: Colors.black12,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child:
                Text('Items',style: GoogleFonts.montserrat(fontSize: 14.t),)),
                Text('100000 VND',style: GoogleFonts.montserrat(fontSize: 14.t),),
              ],
            ),
            SizedBox(height: 8.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child:
                Text('Delivery',style: GoogleFonts.montserrat(fontSize: 14.t),)),
                Text('100000 VND',style: GoogleFonts.montserrat(fontSize: 14.t),),
              ],
            ),
            SizedBox(height: 8.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child:
                Text('Total price',style: GoogleFonts.sansita(fontSize: 17.t),)),
                Text('100000 VND',style: GoogleFonts.sansita(fontSize: 17.t),),
              ],
            ),
            SizedBox(height: 16.w),
            Material(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w)),
                elevation: 8.0,
                clipBehavior: Clip.antiAlias,
                color: Colors.amber,
                child: MaterialButton(
                    splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                    height: 42.w,
                    minWidth: 343.w,
                    onPressed: (){
                      // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CheckOutPage()));
                    },
                    child:
                    Text('Pay',style: GoogleFonts.nunito(fontSize: 17.t),),
                )
            ),
          ],
        ),
      ),
    );
  }

  // Build Body
  _buildBody(){
    return Padding(
      padding: EdgeInsets.only(top: 25.w,right: 16.w, left: 16.w),
      child: Column(
        children: [
          Row(children: [
            const Icon(Icons.location_on),
            SizedBox(width: 12.w),
            Expanded(child: Text('Shipping Address',style: GoogleFonts.sansita(fontSize: 19.t))
            )
          ]),
          SizedBox(height: 16.w),
          Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            borderOnForeground: false,
            child: Container(
              padding: EdgeInsets.all(10.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Oleh Chabanov',style: GoogleFonts.montserrat(fontSize: 14.t,fontWeight: FontWeight.bold)),
                      SizedBox(height:6.w),
                      Text('225 Highland Ave Springfield, IL 62704, USA',style: GoogleFonts.montserrat(fontSize: 14.t),maxLines: 2,),
                    ],
                  )),
                  Material(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w)),
                      clipBehavior: Clip.antiAlias,
                      child: MaterialButton(
                          splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                          height: 24.w,
                          minWidth: 24.w,
                          onPressed: (){
                            print('click abc');
                            // ),
                          },
                          padding: EdgeInsets.all(12.w),
                          child: Icon(
                            Icons.trending_flat,
                            color:  const Color.fromRGBO(52, 40, 62, 1.0),
                            size: 20.w,
                          )
                      )
                  )
                ],
              )
            )
          ),
          SizedBox(height: 33.w),
          Row(children: [
            const Icon(Icons.local_shipping),
            SizedBox(width: 12.w),
            Expanded(child: Text('Delivery Method',style: GoogleFonts.sansita(fontSize: 19.t))
            )
          ]),
          SizedBox(height: 16.w),
          SizedBox(height: 16.w),
          Row(children: [
            const Icon(Icons.payment),
            SizedBox(width: 12.w),
            Expanded(child: Text('Payment Method',style: GoogleFonts.sansita(fontSize: 19.t))
            )
          ]),
          SizedBox(height: 16.w),
          Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              borderOnForeground: false,
              child: Container(
                  padding: EdgeInsets.all(10.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: Text('Payment Method',style: GoogleFonts.sansita(fontSize: 19.t))
                      ),
                      Material(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w)),
                          clipBehavior: Clip.antiAlias,
                          child: MaterialButton(
                              splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                              height: 24.w,
                              minWidth: 24.w,
                              onPressed: (){
                                print('click abc');
                                // ),
                              },
                              padding: EdgeInsets.all(12.w),
                              child: Icon(
                                Icons.trending_flat,
                                color:  const Color.fromRGBO(52, 40, 62, 1.0),
                                size: 20.w,
                              )
                          )
                      )
                    ],
                  )
              )
          ),

        ],
      ),
    );
  }
}
