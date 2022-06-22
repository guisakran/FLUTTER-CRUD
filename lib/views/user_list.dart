import 'package:crud_gratis/components/user_tile.dart';
import 'package:crud_gratis/model/user.dart';
import 'package:crud_gratis/provider/user.dart';
import 'package:crud_gratis/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRouters.USER_FORM,
                  arguments: const User(
                    name: '',
                    email: '',
                    avatarURL: '',
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (ctx, i) => UserTile(users.byIndex(i))),
    );
  }
}
