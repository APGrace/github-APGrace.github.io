import 'package:flutter/material.dart';
import 'contact.dart';
import 'contact_details.dart';
import 'contact_create.dart'; // Import the AddContactScreen widget if not already imported

class ContactsList extends StatefulWidget {
  final List<Contact> contacts;

  ContactsList({Key? key, required this.contacts}) : super(key: key);

  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  late List<Contact> _contacts;

  @override
  void initState() {
    super.initState();
    _contacts = widget.contacts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: _contacts[index].imagePath != null
                  ? AssetImage(_contacts[index].imagePath!)
                  : null,
            ),
            title: Text(_contacts[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ContactDetails(contact: _contacts[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddContactScreen(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _navigateToAddContactScreen(BuildContext context) async {
    final newContact = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddContactScreen(
                addContactCallback: (Contact newContact) {
                  _addContact((newContact));
                },
              )),
    );
    if (newContact != null) {
      _addContact(newContact as Contact);
    }
  }

  void _addContact(Contact newContact) {
    setState(() {
      _contacts.add(newContact);
    });
  }
}
