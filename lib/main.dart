import 'package:crud_gratis/provider/user.dart';
import 'package:crud_gratis/routes/app_routes.dart';
import 'package:crud_gratis/views/user_form.dart';
import 'package:crud_gratis/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: const UserList(),
        routes: {
          AppRouters.HOME: (_) => const UserList(),
          AppRouters.USER_FORM: (_) => UserForm(),
        },
      ),
    );
  }
}
