import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libuta_sugbo_app/models/user_model.dart';


UserBox _userBox = UserBox();

class StatisticModel {
  String title;
  String subTitle;
  int count;
  IconData icon;
  String path;
  Color iconColor;
  Color iconBgColor;
  
  StatisticModel({
    required this.title,
    required this.subTitle,
    required this.count,
    required this.path,
    required this.icon,
    this.iconColor = Colors.white,
    required this.iconBgColor
  });
}

class DashboardWebMainWidget extends StatelessWidget {
  const DashboardWebMainWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {


    List<StatisticModel> statisticList =
    _userBox.userData.userType.toString().toLowerCase() == "owner" || _userBox.userData.userType.toString().toLowerCase() == "admin" ? 
    [
      StatisticModel(title: "Staff",subTitle:"Active Staff",count:0,path:"",icon:FontAwesomeIcons.user,iconBgColor:Colors.blueAccent,iconColor: Colors.white),
      // StatisticModel(title: "Inactive Staff",subTitle:"Number of Inactive Staff",count: _storeUserBox.getStaffCount(status: "inactive"),path:"",icon:FontAwesomeIcons.users,iconBgColor:Colors.green,iconColor: Colors.white),
      StatisticModel(title: "Stocks",subTitle:"Stocks",count: 0,path:"",icon:FontAwesomeIcons.p,iconBgColor:Colors.green,iconColor: Colors.white),
      StatisticModel(title: "Expired Stocks",subTitle:"Expired Stocks",count:0,path:"",icon:FontAwesomeIcons.p,iconBgColor:Colors.redAccent,iconColor: Colors.white),
      // StatisticModel(title: "Unavailable Stocks",subTitle:"Inactive Stocks",count: _stockBox.getItemCount(status: "inactive"),path:"",icon:FontAwesomeIcons.p,iconBgColor:Colors.redAccent,iconColor: Colors.white),
    ] : [
      StatisticModel(title: "Complete Order",subTitle:"Total Complete Order",count:0 ,path:"",icon:FontAwesomeIcons.check,iconBgColor:Colors.blueAccent,iconColor: Colors.white),
      StatisticModel(title: "Approve Order",subTitle:"Total Approve Order",count:0 ,path:"",icon:FontAwesomeIcons.thumbsUp,iconBgColor:Colors.green,iconColor: Colors.white),
      // StatisticModel(title: "No Payment Order",subTitle:"Total No Payment Order",count:_orderItemBox.getOrderItemWithNoPayment().length ,path:"",icon:FontAwesomeIcons.p,iconBgColor:Colors.redAccent,iconColor: Colors.white),
      StatisticModel(title: "No Payment Order",subTitle:"Total No Payment Order",count:0 ,path:"",icon:FontAwesomeIcons.triangleExclamation,iconBgColor:Colors.yellowAccent,iconColor: Colors.white),
    ];

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            itemCount: statisticList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 15.0 / 12.0,
              crossAxisCount: 4,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return ViewItems(
                    //       selectedProduct: statisticList[index].name,
                    //     );
                    // }));
                },
                child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Card(
                        semanticContainer: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      statisticList[index].title.toString(),
                                      style: const TextStyle(fontSize: 15.0),
                                    )),
                                    Container(
                                      color: statisticList[index].iconBgColor,
                                      width: 50,
                                      height: 30,
                                      child: Icon(
                                        statisticList[index].icon,
                                        color:statisticList[index].iconColor
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                statisticList[index].count.toString(),
                                 style: const TextStyle(fontSize: 18.0),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      statisticList[index].subTitle.toString(),
                                      style: const TextStyle(fontSize: 10.0),
                                    )),
                                    Icon(
                                      statisticList[index].icon, 
                                      color:statisticList[index].iconBgColor
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      )
                    ),
              );
            },
          ),
        )
      ],
    );
  }
}