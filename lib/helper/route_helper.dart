import 'package:career_map/HomeScreen/LoginPage.dart';
import 'package:get/get.dart';

import '../HomeScreen/Api_Payment.dart';
import '../HomeScreen/CarrerOptions/CarrierDetails.dart';
import '../HomeScreen/CarrerOptions/Registerpage.dart';
import '../HomeScreen/EditProfile.dart';
import '../HomeScreen/HomePage.dart';
import '../HomeScreen/MccAnd mss/Mcc.dart';
import '../HomeScreen/NaviagtionScreen.dart';
import '../HomeScreen/SignUp.dart';
import '../HomeScreen/Splash.dart';
import '../HomeScreen/api_test_task.dart';

class RouteHelper{
  static const String splash = "/Splash";
  static const String Login = "/Login";
  static const String RegisterScreen = "/Register_Screen";
  static const String BottomNavScreen = "/BottomNavigation_Screnn";
  static const String HomeScreen = "/Home_Screen";
  static const String CarrerDetails = "/Carrer_Details";
  static const String Carrierregister = "/Carrier_register";
  static const String Mccpage = "/Mcc_page";
  static const String Edit_Profile = "/EditProfile";
  static const String ApiTest_Task = "/ApiTest_Task";
  static const String ApiPayment = "/Api_Payment";

  ///Exit


  static String getLogin() =>"$Login";
  static String getRegister() =>"$RegisterScreen";
  static String getBottomNav() =>"$BottomNavScreen";
  static String getHomeScreen() =>"$HomeScreen";
  static String getCarrer_Details() =>"$CarrerDetails";
  static String getCarrier_register() =>"$Carrierregister";
  static String getMcc_page() =>"$Mccpage";
  static String getEditProfile() =>"$Edit_Profile";
  static String getApiTestTask() =>"$ApiTest_Task";
  static String getApi_Payment() =>"$ApiPayment";
  static String getSplash() =>"$splash";

  ///Exit


  static List<GetPage> routes = [
    GetPage(name: Login, page: () => Login_Screen()),
    GetPage(name: RegisterScreen, page: () => Register_Screen()),
    GetPage(name: BottomNavScreen, page: () => BottomNavigation_Screnn()),
    GetPage(name: RegisterScreen, page: () => Home_Screen()),
    GetPage(name: CarrerDetails, page: () => Carrer_Details(Details: "",image: "",)),
    GetPage(name: Carrierregister, page: () => Carrier_register()),
    GetPage(name: Mccpage, page: () => Mcc_page()),
    GetPage(name: Edit_Profile, page: () => EditProfile()),
    GetPage(name: ApiTest_Task, page: () => ApiTestTask()),
    GetPage(name: ApiPayment, page: () => Api_Payment()),
    GetPage(name: splash, page: () => Splash()),

    ///Exit
  ];

}