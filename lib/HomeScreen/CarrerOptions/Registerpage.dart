import 'package:career_map/base/AppContent.dart';
import 'package:career_map/helper/Textfield.dart';
import 'package:career_map/helper/message.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Carrier_register extends StatefulWidget {
  const Carrier_register({Key? key}) : super(key: key);

  @override
  State<Carrier_register> createState() => _Carrier_registerState();
}

class _Carrier_registerState extends State<Carrier_register> {
  TextEditingController Name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController Contact=TextEditingController();
  TextEditingController Collagename=TextEditingController();
  TextEditingController City=TextEditingController();
  TextEditingController Desc=TextEditingController();
  final GlobalKey _form=GlobalKey<FormState>();

  Razorpay? _razorpay;

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    showCustomSnackBar(message: "Payment Successful Done ", context: context);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    showCustomSnackBar(message: "Error in Payment", context: context);
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

   void paynow(){
     var options = {
     'key': '${AppContent.key}',
     'amount': 100,
     'name': 'carrier map',
     'description': 'Fine T-Shirt',
     'prefill': {
     'contact': '8888888888',
     'email': 'test@razorpay.com',
     'external': {
     'wallets': ['paytm']
     }
     }
     };
     try {
       _razorpay!.open(options);
     } catch (e) {
       debugPrint(e.toString());
     }
   }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        shadowColor: Colors.grey.shade500,
        title: Text("Register",style: TextStyle(color:Colors.black87,fontSize: 15,fontWeight: FontWeight.bold,letterSpacing: 0.3)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                CircleAvatar(
                  backgroundImage:AssetImage("asset/profile_demo.png"),
                  radius: 30,
                ),
                SizedBox(height: 20,),
                Textfield_Round(contrl: Name, label: "name"),
                SizedBox(height: 15,),
                Textfield_Round(contrl: email, label: "email"),
                SizedBox(height: 15,),
                Textfield_Round(contrl: Contact, label: "Contact no",keyboardType: TextInputType.number),
                SizedBox(height: 15,),
                Textfield_Round(contrl: Collagename, label: "Collage name",),
                SizedBox(height: 15,),
                Textfield_Round(contrl: City, label: "City",),
                SizedBox(height: 15,),
                Textfield_Round(contrl: Desc, label: "Description",),
                SizedBox(height: 25,),
                InkWell(
                  onTap: (){
                    paynow();
                  },
                  child: Button2("Register", 50, width, EdgeInsets.only(left: 10,right: 10,bottom: 10),13),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
