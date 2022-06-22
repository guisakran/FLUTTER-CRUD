import 'dart:math';

import 'package:crud_gratis/data/dammy_user.dart';
import 'package:crud_gratis/model/user.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USER};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id!.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      //Alterar
      _items.update(
        user.id!,
        (_) => User(
          id: user.id,
          name: user.name,
          email: user.email,
          avatarURL: user.avatarURL,
        ),
      );
    } else {
      //Novo
      final id = Random().nextDouble().toString();

      _items.putIfAbsent(
          id,
          () => User(
              id: id,
              name: user.name,
              email: user.email,
              avatarURL: user.avatarURL));
    }

    notifyListeners();
  }

  void remove(User user) {
    if (user.id != null &&
        user.id!.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.remove(user.id);

      notifyListeners();
    }
  }
}
