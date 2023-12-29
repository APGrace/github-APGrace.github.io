import 'package:flutter/material.dart';
import 'contacts_list.dart';
import 'contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Contact contact1 = Contact(
      name: 'Jom',
      phoneNumber: '+639348700821',
      email: 'joins@gmail.com',
      imagePath: 'assets/catto.jpg',
    );

    Contact contact2 = Contact(
      name: 'AJae',
      phoneNumber: '+639272288029',
      email: 'insolenteapril@gmail.com',
      imagePath: 'assets/Savage_.jpg',
    );

    List<Contact> contacts = [contact1, contact2];

    return MaterialApp(
      title: 'Contacts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactsList(contacts: contacts),
    );
  }
}
