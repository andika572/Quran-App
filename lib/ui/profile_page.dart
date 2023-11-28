import 'package:flutter/material.dart';

import 'package:flutter_ahlul_quran_app/data/models/user_model.dart'; // Import the Member class and dummyMembers list

class MembersListScreen extends StatefulWidget {
  @override
  _MembersListScreenState createState() => _MembersListScreenState();
}

class _MembersListScreenState extends State<MembersListScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? _addMember() {
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final id = _idController.text;

    if (username.isEmpty || email.isEmpty || password.isEmpty || id.isEmpty) {
      Navigator.of(context).pop();
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields.'),
        ),
      );
    }

    // Create a new member and add it to the dummyMembers list
    final newMember =
    Member(username: username, email: email, password: password, id: id);

    setState(() {
      dummyMembers.add(newMember);
    });

    // Clear input fields
    _usernameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _idController.clear();

    // Close the modal bottom sheet
    Navigator.of(context).pop();

    // Show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('User added successfully.'),
      ),
    );
  }

  void _deleteMember(int index) {
    // Remove the member at the given index from the dummyMembers list
    if (index >= 0 && index < dummyMembers.length) {
      setState(() {
        dummyMembers.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3667A6),
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: dummyMembers.length,
        itemBuilder: (context, index) {
          final member = dummyMembers[index];
          return MemberCard(
            member: member,
            onDelete: () => _deleteMember(index),
            index: index,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff3667A6),
        onPressed: () {
          // Show the modal bottom sheet for adding a new member
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Add New User',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(labelText: 'Username'),
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Password'),
                      ),
                      TextFormField(
                        controller: _idController,
                        decoration: InputDecoration(labelText: 'Terakhir Baca'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _addMember,
                        child: Text('Add User'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  final Member member;
  final VoidCallback onDelete;
  final int index;

  MemberCard(
      {required this.member, required this.onDelete, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xff3667A6),
          radius: 60,
          child: Text(member.username, style: TextStyle(color: Colors.white),),
        ),
        title: Text(member.email),
        subtitle: Text(member.id),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline_outlined),
          onPressed: onDelete, // Call the onDelete callback when pressed
        ),
      ),
    );
  }
}
