import 'package:flutter/material.dart';

@immutable
class Person {
  final String? name;
  final String? email;
  final String? nation;
  final String? lastName;

  const Person({
    required this.name,
    required this.email,
    required this.nation,
    required this.lastName,
  });

  Person copyWith({
    String? name,
    String? email,
    String? nation,
    String? lastName,
  }) {
    return Person(
      name: name ?? this.name,
      email: email ?? this.email,
      nation: nation ?? this.nation,
      lastName: lastName ?? this.lastName,
    );
  }

  Person clone() => copyWith(
        name: name,
        email: email,
        nation: nation,
        lastName: lastName,
      );
}
