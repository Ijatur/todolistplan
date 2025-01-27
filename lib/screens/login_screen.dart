import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'planner_screen.dart';

void main() {
  runApp(DailyPlanningApp());
}

class DailyPlanningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Simulasi data pengguna (array sederhana)
  List<Map<String, String>> users = [
    {'username': 'admin', 'password': 'admin123'}
  ];

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;

    // Validasi username dan password
    bool isValidUser = users.any((user) =>
        user['username'] == username && user['password'] == password);

    if (isValidUser) {
      // Navigasi ke halaman Planner jika login berhasil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PlannerScreen(),
        ),
      );
    } else {
      // Tampilkan notifikasi jika login gagal
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Invalid username or password!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              const SizedBox(height: 30),
              _buildTextField(controller: usernameController, labelText: "Username"),
              const SizedBox(height: 15),
              _buildPasswordField(controller: passwordController),
              const SizedBox(height: 15),
              _buildLoginButton(),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen(users: users)),
                  );
                },
                child: const Text("Don't have an account? Register here"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          "Welcome",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Let's start your daily planning",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String labelText}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPasswordField({required TextEditingController controller}) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.visibility),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: login,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
      child: const Text(
        "Login",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
