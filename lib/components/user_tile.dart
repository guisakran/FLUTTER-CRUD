import 'package:crud_gratis/model/user.dart';
import 'package:crud_gratis/provider/user.dart';
import 'package:crud_gratis/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User? user;
  const UserTile(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = user!.avatarURL == null || user!.avatarURL.isEmpty
        ? const CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user!.avatarURL),
          );

    return ListTile(
        leading: avatar,
        title: Text(user!.name),
        subtitle: Text(user!.email),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRouters.USER_FORM,
                    arguments: user,
                  );
                },
                icon: const Icon(Icons.edit),
                color: Colors.orange,
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Excluir Usuário'),
                      content: Text(
                          'Você realmente gostaria de remover esse usuáro?'),
                      actions: [
                        TextButton(
                          child: Text('Não'),
                          onPressed: () => Navigator.of(context).pop(false),
                        ),
                        TextButton(
                          child: Text('Sim'),
                          onPressed: () => Navigator.of(context).pop(true),
                        ),
                      ],
                    ),
                  ).then((confirmed) {
                    if (confirmed) {
                      Provider.of<Users>(context, listen: false).remove(user!);
                    }
                  });
                },
                icon: const Icon(Icons.delete),
                color: Colors.red,
              ),
            ],
          ),
        ));
  }
}
