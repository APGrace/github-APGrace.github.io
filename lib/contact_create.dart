import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'contact.dart';

class AddContactScreen extends StatefulWidget {
  final Function(Contact) addContactCallback;

  const AddContactScreen({Key? key, required this.addContactCallback})
      : super(key: key);

  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  late String _name = '';
  late String _phoneNumber = '';
  late String _email = '';
  File? _imageFile;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact'),
        backgroundColor: const Color.fromARGB(255, 106, 171, 224),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Phone Number'),
              onChanged: (value) {
                setState(() {
                  _phoneNumber = value;
                });
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: getImage,
              child: const Text('Add Image'),
            ),
            const SizedBox(height: 20),
            _imageFile != null
                ? Image.network(
                    _imageFile!.path,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  )
                : Container(), // Show selected image or empty container if no image is selected
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Contact newContact = Contact(
                  name: _name,
                  phoneNumber: _phoneNumber,
                  email: _email,
                  imagePath: _imageFile != null ? _imageFile!.path : null,
                );
                widget.addContactCallback(newContact);
                Navigator.pop(context);
              },
              child: const Text('Save Contact'),
            ),
          ],
        ),
      ),
    );
  }
}
