import 'package:flutter/material.dart';
import 'package:l4_seance_2/controller/login_controller.dart';
import 'package:l4_seance_2/view/home_page.dart';
import 'package:l4_seance_2/view/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = LoginController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
        backgroundColor: Color.fromRGBO(38, 195, 24, 1),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('EMAIL', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            TextField(controller: _emailController, keyboardType: TextInputType.emailAddress, decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'email@example.com')),
            SizedBox(height: 20),
            Text('PASSWORD', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            TextField(controller: _passwordController, obscureText: true, decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Mot de passe')),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _doLogin,
                child: _isLoading ? CircularProgressIndicator(color: Colors.white) : Text('SE CONNECTER'),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterPage()));
                },
                child: Text('Pas encore inscrit ? Créer un compte'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _doLogin() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Veuillez remplir tous les champs'), backgroundColor: Colors.red));
      return;
    }

    setState(() => _isLoading = true);

    final error = await _controller.login(email, password);

    if (error == null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error), backgroundColor: Colors.red));
    }

    setState(() => _isLoading = false);
  }
}
