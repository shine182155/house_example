import 'package:get/get.dart';
import 'package:house_example/home/home_binding.dart';
import 'package:house_example/home/home_view.dart';
import 'package:house_example/loading/loading_binding.dart';
import 'package:house_example/loading/loading_view.dart';
import 'package:house_example/tab_home/image_detail/image_detail_binding.dart';
import 'package:house_example/tab_home/image_detail/image_detail_view.dart';
import 'package:house_example/tab_profile/pages/room_manage/room_manage_binding.dart';
import 'package:house_example/tab_profile/pages/room_manage/room_manage_view.dart';
import 'package:house_example/tab_profile/pages/room_release/room_release_binding.dart';
import 'package:house_example/tab_profile/pages/user_login/user_login_view.dart';
import 'package:house_example/tab_profile/pages/user_register/user_register_view.dart';
import 'package:house_example/tab_profile/pages/user_setting/user_setting.dart';
import 'package:house_example/tab_search/middle_ware/room_detail_middle_ware.dart';
import 'package:house_example/tab_search/pages/room_detail/room_detail_binding.dart';
import 'package:house_example/tab_search/pages/room_detail/room_detail_view.dart';

import '../privacy_authorization_dialog/privacy_authorization_dialog_view.dart';
import '../tab_profile/pages/room_release/room_release_view.dart';
 
class RouteGet { 
  ///root page 
  static const String home = "/"; 
  static const String userLogin = "/userLogin";
  static const String userRegister = "/userRegister";
  static const String userSetting = "/userSetting";
  static const String imageDetail = "/imageDetail";
  static const String roomDetail= "/roomDetail";
  static const String roomManage= "/roomManage";
  static const String roomRelease= "/roomRelease";
  static const String loadingPage= "/loadingPage";
  static const String privacyAuthorizationDialog = "/privacyAuthorizationDialog";


  ///pages map 
  static final List<GetPage> getPages = [ 
    GetPage(name: home, page: () => HomePage(),binding: HomeBinding()),
    GetPage(name: userLogin, page: () => UserLoginPage()),
    GetPage(name: userRegister, page: () => UserRegisterPage()),
    GetPage(name: userSetting, page: () => UserSetting()),
    GetPage(name: imageDetail, page: () => ImageDetailPage(),binding:ImageDetailBinding()),
    GetPage(name: roomDetail, page: () => RoomDetailPage(),binding:RoomDetailBinding(),middlewares:   [RoomDetailMiddleware()]),
    GetPage(name: roomManage, page: () => RoomManagePage(),binding:RoomManageBinding()),
    GetPage(name: roomRelease, page: () => RoomReleasePage(),binding: RoomReleaseBinding()),
    GetPage(name: loadingPage, page: () => LoadingPage(),binding: LoadingBinding()),
    GetPage(name: privacyAuthorizationDialog, page: () => PrivacyAuthorizationDialogPage()),
  ];
}