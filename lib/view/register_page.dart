import 'package:flutter/material.dart';
import 'package:l4_seance_2/controller/register_controller.dart';
import 'package:l4_seance_2/view/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = RegisterController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inscription'), backgroundColor: Color.fromRGBO(38, 195, 24, 1)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NOM', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            TextField(controller: _nameController, decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Votre nom')),
            SizedBox(height: 20),
            Text('EMAIL', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            TextField(controller: _emailController, keyboardType: TextInputType.emailAddress, decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'email@example.com')),
            SizedBox(height: 20),
            Text('PASSWORD', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            TextField(controller: _passwordController, obscureText: true, decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Mot de passe')),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _register,
                child: _isLoading ? CircularProgressIndicator(color: Colors.white) : Text('S\'INSCRIRE'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _register() async {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Veuillez remplir tous les champs'), backgroundColor: Colors.red));
      return;
    }

    setState(() => _isLoading = true);

    final error = await _controller.register(name, email, password);

    if (error == null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error), backgroundColor: Colors.red));
    }

    setState(() => _isLoading = false);
  }
}
