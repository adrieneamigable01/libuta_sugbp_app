import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:libuta_sugbo_app/models/listing_list_model.dart';
import 'package:libuta_sugbo_app/models/user_model.dart';


UserBox _userBox = UserBox();
ListingListBox _listingListBox = ListingListBox();

class DashboardOwnerListingWidget extends StatelessWidget {
  const DashboardOwnerListingWidget({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {


    bool isLoading = false ;


    
  Widget createListingButton = Container(
    width: 300,
    height: 50,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Colors.lightBlue,
          // Color(0xff03E5B7),
          Colors.lightBlue,
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      // borderRadius: BorderRadius.circular(30.0),
    ),
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(30.0)),
    child: MaterialButton(
    onPressed: !isLoading
          ? () {
              
            }
          // ignore: dead_code
          : null,
      child: const Text(
        "Create Listing",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));

    return Column(
      children: [
        Visibility(
          visible: _listingListBox.recordsByUser.length == 0,
          child: Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  createListingButton
                ],
              ),
            ),
          ),
        
        ), 
        Visibility(
          visible: _listingListBox.recordsByUser.length > 0,
          child: Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 5.0,right: 5.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add),
                            Text(
                              "Add ".toUpperCase(),
                              style: TextStyle(fontSize: 14)
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )
                          )
                        ),
                        onPressed: () => null
                      )
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: _listingListBox.recordsByUser.length,
                        // itemCount: 20,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          // childAspectRatio: 2.0,
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (BuildContext context, int index)  {
                          
                          return Padding(
                              padding: EdgeInsets.all(5),
                              child: Card(
                                  semanticContainer: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                          onPressed: () {
                             
                                          },
                                          icon: const Icon(Icons.cancel),
                                          color: Colors.red,
                                           tooltip: 'Void ${_listingListBox.recordsByUser[index].listingName}',
                                        ),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 25,),
                                                  Container(
                                                    child: Image.network('https://cf.bstatic.com/xdata/images/hotel/max1024x768/238487133.jpg?k=3f152e9bd274337c5e2a0cc276c45ccf6e432feaac5dea777b8cd07ad125ebc5&o=&hp=1'),
                                                  ),
                                                  SizedBox(height: 10.0,),
                                                  Container(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          _listingListBox.recordsByUser[index].listingName.toString(),
                                                          style:TextStyle(fontSize: 19.0,fontWeight: FontWeight.bold),
                                                        ),
                                                        const SizedBox(height: 5.0,),
                                                        Row(
                                                          children: [
                                                            Visibility(
                                                              visible: _listingListBox.recordsByUser[index].capacity != null,
                                                              child: Text(
                                                                _listingListBox.recordsByUser[index].capacity.toString(),
                                                                style:TextStyle(fontSize: 16.0),
                                                              ),
                                                            ),
                                                            Visibility(
                                                              visible: _listingListBox.recordsByUser[index].capacity == null,
                                                              child: Text(
                                                                _listingListBox.recordsByUser[index].listingType.toString(),
                                                                style:TextStyle(fontSize: 16.0),
                                                              ),
                                                            ),
                                                            Spacer(),
                                                            Text(
                                                              _listingListBox.recordsByUser[index].price.toString(),
                                                              style:TextStyle(fontSize: 16.0),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                ],
                                              )),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: IconButton(
                                          onPressed: () {
                             
                                          },
                                          icon: const Icon(Icons.edit),
                                          color: Colors.greenAccent,
                                          tooltip: 'Update ${_listingListBox.recordsByUser[index].listingName}',
                                        ),
                                      ),
                                    ],
                                  )));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
         ),
      ],
    );
  }
}