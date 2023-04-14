import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class AlertDialogWidget {

  showDetailsDialog({required BuildContext context,required String title,required String  desc,required Widget content}) async {
    await Alert(
      type:AlertType.none,
      context: context,
      title: title,
      desc: desc,
      content: content,
      buttons: [
        DialogButton(child: const Text('OK'),
        onPressed: (){
          Navigator.of(context, rootNavigator: true).pop();
        })
      ],
      closeFunction: (){
        Navigator.of(context, rootNavigator: true).pop();
      },
      
    ).show();
  }

  showAlertMessage({required BuildContext context,required String title,required String  desc,bool isError = false}) async {
    await Alert(
      type: isError == true ? AlertType.error : AlertType.success,
      context: context,
      title: title,
      desc: desc,
      buttons: [
        DialogButton(child: const Text('OK'),
        onPressed: (){
          Navigator.of(context, rootNavigator: true).pop();
        })
      ],
      closeFunction: (){
        Navigator.of(context, rootNavigator: true).pop();
      },
      
    ).show();
  }

  showConfirmDialog({required BuildContext context,required String title,required String  desc,required Function submitCallback}) async {
    await Alert(
      type: AlertType.info,
      context: context,
      title: title,
      desc: desc,
      buttons: [
        DialogButton(child: const Text('OK'),
        onPressed: (){
          Navigator.of(context, rootNavigator: true).pop();
          submitCallback();
        })
      ],
      closeFunction: (){
        Navigator.of(context, rootNavigator: true).pop();
      },
      
    ).show();
  }

  Future showAlertDialog({
    required bool isError,
    required String title,
    required String content,
    required BuildContext context,
    required Function onPressed,
  }) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isError
                    ? const Icon(Icons.warning_rounded,color: Colors.amber,)
                    : const Icon(Icons.check_box_rounded,color:Colors.green),
                const SizedBox(width: 5.0),
                Flexible(child: Text(content),)
              ],
            ),
            actions: <Widget>[
              TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                  }),
            ],
          );
        });
  }

  showLoadingDialog({
    required BuildContext context,
    required Function onPressed,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Loading...'),
                SizedBox(
                  width: 15.0,
                ),
                CircularProgressIndicator(),
              ],
            ),
            actions: null,
          );
        });
  }

  showLogoutLoadingDialog({
    required BuildContext context,
    required Function onPressed,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Logging out...'),
                SizedBox(
                  width: 15.0,
                ),
                CircularProgressIndicator(),
              ],
            ),
            actions: null,
          );
        });
  }

  showCustomContentDialog({
    required BuildContext context,
    required Widget content,
    required Widget title,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            titlePadding: const EdgeInsets.all(0),
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
            title: Container(
              color: Colors.green,
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  title,
                  Spacer(),
                  TextButton(
                    child: const Icon(
                      FontAwesomeIcons.xmark,
                      color:Colors.white,
                      size: 16.0,  
                    ),
                    onPressed: () {
                     Navigator.of(context).pop();
                  }),
                ],
              ),
            ),
           
            content: Container(
              width: MediaQuery.of(context).size.width*0.45,
              height: MediaQuery.of(context).size.height*0.75,
              child: content,
            ),
            actions: null,
          );
        });
  }

  showCustomFormDialog({
    required BuildContext context,
    required Widget form,
    required Widget title,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            titlePadding: const EdgeInsets.all(0),
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
            title: Container(
              color: Colors.green,
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  title,
                  Spacer(),
                  TextButton(
                    child: const Icon(
                      FontAwesomeIcons.xmark,
                      color:Colors.white,
                      size: 16.0,  
                    ),
                    onPressed: () {
                     Navigator.of(context).pop();
                  }),
                ],
              ),
            ),
           
            content: Container(
              width: MediaQuery.of(context).size.width*0.45,
              height: MediaQuery.of(context).size.height*0.75,
              child: form,
            ),
            actions: null,
          );
        });
  }

  showCustomConfirmsDialog({
    required BuildContext context,
    required Widget body,
    required Widget title,
    required Function confirmCallback,
    Function? cancelCallback,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            title: Row(
              children: [
                title,
                Spacer(),
                TextButton(
                  child: const Icon(
                    FontAwesomeIcons.xmark,
                    color:Colors.grey,
                    size: 16.0,  
                  ),
                  onPressed: () {
                   Navigator.of(context).pop();
                }),
              ],
            ),
           
            content: Container(
              width: MediaQuery.of(context).size.width*0.45,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.warning_rounded,color: Colors.blue,size: 100,),
                  body,
                ],
              ),
            ),
            actions: [
              Container(
                  constraints: const BoxConstraints(
                      minWidth: 300.0, maxWidth: 300.0, minHeight: 20.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.blueAccent,
                        // Color(0xff03E5B7),
                        Colors.blueAccent,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: (){
                      Navigator.of(context).pop();
                      confirmCallback();
                    },
                    child: const Text(
                      "Yes",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              Container(
                  constraints: const BoxConstraints(
                      minWidth: 300.0, maxWidth: 300.0, minHeight: 20.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.redAccent,
                        // Color(0xff03E5B7),
                        Colors.redAccent,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "No",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ],
          );
        });
  }


}