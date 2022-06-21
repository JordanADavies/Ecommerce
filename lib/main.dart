import 'package:ecommerce/e_commerce_app.dart';
import 'package:ecommerce/screens/login/infrastructure/local/user_token_storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initHive();

  final userTokenStorageProvider = UserTokenStorageProvider();
  final loggedIn = await userTokenStorageProvider.tokenExists();
  runApp(ECommerceApp(userLoggedIn: loggedIn));
}

Future<void> _initHive() async {
  final documentsDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
}
