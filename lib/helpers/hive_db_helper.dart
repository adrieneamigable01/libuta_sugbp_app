import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'package:libuta_sugbo_app/models/user_model.dart';
import 'package:libuta_sugbo_app/models/user_info_model.dart';
import 'package:libuta_sugbo_app/models/business_info_model.dart';
import 'package:libuta_sugbo_app/models/listing_list_model.dart';

///HiveDB Helper
///
/// A simple helper to centralize boxes initialization and adapter registrations.
class HiveDBHelper {
  ///Initializes the boxes and registers its corresponding adapters.
  Future openAndRegisterBoxes() async {
    if (kIsWeb) {
      await Hive.initFlutter();
    } else {
      final appDocumentDir =
          await pathProvider.getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);
    }

    Hive.registerAdapter(Adapters.userModelAdapter);
    Hive.registerAdapter(Adapters.userInfoModelAdapter);
    Hive.registerAdapter(Adapters.businessInfoModelAdapter);
    Hive.registerAdapter(Adapters.listingListModelAdapter);
    // Hive.registerAdapter(Adapters.timesheetModelAdapter);

    await Hive.openBox(Boxes.userBox);
    await Hive.openBox(Boxes.userInfoBox);
    await Hive.openBox(Boxes.businessInfoBox);
    await Hive.openBox(Boxes.listingListBox);
    // await Hive.openBox(Boxes.timesheetBox);
  }

  ///Initializes the box and register its corresponding adapter.
  ///
  ///An optional method to open and register a single box and adapter.
  Future openAndRegisterBox(adapter, box) async {
    final appDocumentDir = await pathProvider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(adapter);
    await Hive.openBox(box);
  }

  ///Closes all the boxes used in the app, may be called during app close.
  closeBoxes() {
    Hive.close();
  }

  Future truncateBoxes() async {
    await Hive.deleteFromDisk();
  }
}

///Static box list.
///
/// All box names must be declared here, box name and box variable must be the same.
class Boxes {

  static const String userBox             = 'userBox';
  static const String userInfoBox         = 'userInfoBox';
  static const String businessInfoBox     = 'businessInfoBox';
  static const String listingListBox      = 'listingListBox';
}

///Static adapter list.
///
/// Although hive supports primitives, maps and list types, still in order for us to insert custom objects
/// an adapter must be generated using the hive_generator plugin.
///
/// All adapters must be declared here, adapter class ***pascal case*** and adapter variable ***camel case***
/// must be of same name for intuitive declaration.
class Adapters {
  // static final ProfileModelAdapter profileModelAdapter = ProfileModelAdapter();
  static final UserModelAdapter userModelAdapter                      = UserModelAdapter();
  static final UserInfoModelAdapter userInfoModelAdapter              = UserInfoModelAdapter();
  static final BusinessInfoModelAdapter businessInfoModelAdapter      = BusinessInfoModelAdapter();
  static final ListingListModelAdapter listingListModelAdapter        = ListingListModelAdapter();
}
