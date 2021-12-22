import 'package:ecommerce/dimens.dart';
import 'package:ecommerce/ui/checkout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomSheet: _buildBottomSheet(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: Text('Cart',style: GoogleFonts.sansita(fontSize: 19.t)),
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
    );

  }


  _buildBody()=>ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(5.w),
          child: _buildItemCart(),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: 2);


  _buildBottomSheet(){
    return
      Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w)),
      elevation: 8.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: EdgeInsets.all(16.w),
        height: 139.w,
        color: Colors.black12,
        child: Column(
          children: [
            Row(
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const CheckOutPage()));
                    },
                    child:  Text('Check out',style: GoogleFonts.nunito(fontSize: 17.t),),

                )
            ),
          ],
        ),
      ),
    );

  }

  _buildItemCart(){
    return Row(
      children: [
        Image.network('https://bn1301files.storage.live.com/y4mgPRi_zzrco4D__oQQS3yGFVRi0SMKRQ8qe4WCydVOqe43BTu6yMhLwflIjo9aINv5_SvdFsefGvoyznb_LuxXuGlKuwpOngN_ZloHlcC-9jqs3OSZ0ni3o75DcshpBVarW_cEEZmi5OjDWyJtaduY-Q_ubZp-Az0t9c01AV-UHbwywSK6xGA5OYjStzC6SeULY4SrOSzaL7KkLamVSlQ4A/6ad832045786af68599877dab7f234b8.jpg?psid=1&width=670&height=670&cropMode=center',
          width: 80.w,
          height: 80.w,
        ),
        SizedBox(width: 16.w,),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Astylish Women Open Front Long Sleeve Chunky Knit Cardigan',style: GoogleFonts.sansita(fontSize: 14.t),maxLines: 3,),
            SizedBox(height: 8.w,),
            Row(children: [
              Expanded(child:
              Text('10000 VND',style: GoogleFonts.sansita(fontSize: 19.t))),
              MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w)),
                  splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                  height: 24.w,
                  minWidth: 24.w,
                  onPressed: (){
                    print('click abc');
                    // ),
                  },
                  padding: EdgeInsets.all(12.w),
                  child: Icon(
                    Icons.remove,
                    color:  const Color.fromRGBO(52, 40, 62, 1.0),
                    size: 12.w,
                  )
              ),
              SizedBox(width: 2.w,),
              Text('1',style: GoogleFonts.sansita(fontSize: 19.t)),
              SizedBox(width: 2.w,),
              MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w)),
                  splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
                  height: 24.w,
                  minWidth: 24.w,
                  onPressed: (){
                    print('click abc');
                    // ),
                  },
                  padding: EdgeInsets.all(12.w),
                  child: Icon(
                    Icons.add,
                    color:  const Color.fromRGBO(52, 40, 62, 1.0),
                    size: 12.w,
                  )
              ),
            ],),

          ],
        )),
        MaterialButton(
            splashColor: const Color.fromRGBO(132, 95, 161, 1.0),
            height: 24.w,
            minWidth: 24.w,
            onPressed: (){
              print('click abc');
              // ),
            },
            padding: EdgeInsets.all(12.w),
            child: Icon(
              Icons.close,
              color:  const Color.fromRGBO(52, 40, 62, 1.0),
              size: 20.w,
            )
        ),
      ],
    );
  }
}
