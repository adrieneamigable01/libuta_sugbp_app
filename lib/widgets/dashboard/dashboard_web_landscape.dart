import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:libuta_sugbo_app/contants/dropdown_constants.dart';
import 'package:libuta_sugbo_app/cubit/auth/auth_cubit.dart';
import 'package:libuta_sugbo_app/models/business_info_model.dart';
import 'package:libuta_sugbo_app/models/user_model.dart';
import 'package:libuta_sugbo_app/pages/dashboard/dashboard_admin_listing_page.dart';
import 'package:libuta_sugbo_app/pages/dashboard/dashboard_main_page.dart';
import 'package:libuta_sugbo_app/widgets/common/admin_app_bar_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:libuta_sugbo_app/models/user_info_model.dart';

class DashboardWebLandscape extends StatefulWidget {
  const DashboardWebLandscape({super.key});

  @override
  State<DashboardWebLandscape> createState() => _DashboardWebLandscapeState();
}

UserInfoBox _userInfoBox = UserInfoBox();
BusinessInfoBox _businessInfoBox = BusinessInfoBox();
UserBox _userBox = UserBox();




class _DashboardWebLandscapeState extends State<DashboardWebLandscape> {
   
  bool isFirstFlag = true;
  final PageController page = PageController(initialPage: 0);


  getStoreList() {}

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // RouteSettings routeSettings;
    // bool isLoading = false;
    // _customerCubit.getCustomerInfo();

  gotoPage(int index,BuildContext context){
    page.jumpToPage(index);
  }
  
  print("_userInfoBox.data : ${_businessInfoBox.isEmpty}");

    
    return SelectionArea(
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {

              if(state is LoadingAuthState){
                if(state.isLoading){
                  alertDialog.showLoadingDialog(context: context, onPressed: (){

                  });
                }else{
                  Navigator.of(context, rootNavigator: true).pop();
                }
              }
              

              if (state is LogoutState){
                context.push("/");
              }

            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff003580),
            title: Row(
              children: [
                Image.asset('assets/logo/logo.png', width: 30, height: 30),
                const SizedBox(width: 10,),
                Text('${_businessInfoBox.data.businessType}',style:TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
            centerTitle: false,
             actions: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 70.0,
                    maxWidth: 100.0,
                    minHeight: 30.0
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.blueAccent,
                        Colors.blueAccent
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: MaterialButton(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(30.0)),
                    
                    onPressed: () {
                      page.jumpToPage(6);
                    },
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(
                          FontAwesomeIcons.circleChevronUp,
                          color: Colors.white,
                          size: 18.0,
                        ),
                        const Text(
                          " Subscribe",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    
                      if(state is LoadingAuthState){
                        if(state.isLoading){
                          alertDialog.showLoadingDialog(context: context, onPressed: (){

                          });
                        }else{
                          Navigator.of(context, rootNavigator: true).pop();
                        }
                      }

                      if (state is LogoutState){
                        context.push("/");
                      }
                      

                  },
                  child: Container(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        customButton: const Icon(
                          FontAwesomeIcons.bars,
                          size: 25,
                          color: Colors.white,
                        ),
                        items: kDropDownActionButtonAppBar
                            .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Row(
                                  children: [
                                    Icon(
                                      kDropDownActionButtonAppBarIcon[
                                          kDropDownActionButtonAppBar.indexOf(item)],
                                      color: Colors.blue.shade800,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                )))
                            .toList(),
                        onChanged: (newValue) {
                          // int index = kDropDownActionButtonItemMenu
                          //     .indexOf(newValue.toString());

                          if (newValue == "Logout") {
                            // BlocProvider.of<AuthCubit>(context).logout();
                          }

                          if(newValue == "Profile"){
                             gotoPage(13,context);
                          }
                        },
                        itemHeight: 48,
                        itemPadding: const EdgeInsets.only(left: 16, right: 16),
                        dropdownWidth: 160,
                        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                        // dropdownDecoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(4),
                        //   color: Colors.redAccent,
                        // ),
                        dropdownElevation: 8,
                        offset: const Offset(0, 8),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SideMenu(
                controller: page,
                style: SideMenuStyle(
                  displayMode: SideMenuDisplayMode.auto,
                  hoverColor: const Color(0xffe6f0ff),
                  selectedColor: const Color(0xff003580),
                  selectedTitleTextStyle: TextStyle(color: Colors.white),
                  selectedIconColor: Colors.white,
                  openSideMenuWidth: 200,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.all(Radius.circular(10)),
                  // ),
                  // backgroundColor: Colors.blueGrey[700]),
                ),
                title: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                        children: [
                          Text(
                            '${_userInfoBox.data.firstname} ${_userInfoBox.data.middlename} ${_userInfoBox.data.lastname}',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${_businessInfoBox.data.businessName.toString()[0].toUpperCase()}${_businessInfoBox.data.businessName.toString().substring(1).toLowerCase()}',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text('${_userBox.userData.role![0].toUpperCase()}${_userBox.userData.role!.substring(1).toLowerCase()}'),
                        ],
                      ),
                ),
                items: [
                  SideMenuItem(
                    priority: 0,
                    title: 'Dashboard',
                    onTap: () {
                      gotoPage(0,context);
                    },
                    icon: const Icon(Icons.home),
                    // badgeContent: Text(
                    //   '3',
                    //   style: TextStyle(color: Colors.white),
                    // ),
                  ),
                  SideMenuItem(
                    priority: 1,
                    title: 'Listings',
                    onTap: () {
                      gotoPage(1,context);
                    },
                    icon: const Icon(Icons.list_alt),
                    // badgeContent: Text(
                    //   '3',
                    //   style: TextStyle(color: Colors.white),
                    // ),
                  ),
                ]
              ),
              Container(
                child: Expanded(
                  flex: 1,
                  child: PageView(
                    controller: page,
                    children: [
                      Container(
                        color: Colors.white,
                        child: DashboardMainPage(),
                      ),
                      Container(
                        color: Colors.white,
                        child: DashboardAdminListingPage(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
