import 'package:flutter/material.dart';
import '/src/mixins/validate_form_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidateFormMixin {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String password = ''; // 저장 시에도 null 이 아니여야 함.

  @override
  build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              emailField(),
              const SizedBox(height: 20),
              passwordField(),
              const SizedBox(height: 10),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'test@naver.com',
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        border: UnderlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) {
        email =
            value; // value! : validate() 에서 null check 를 했기 때문에 null 이 아님을 보장
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'password',
        hintText: 'more than 4 characters',
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(),
      ),
      obscureText: true,
      validator: validatePassword,
      onSaved: (value) {
        password =
            value!; // value! : validate() 에서 null check 를 했기 때문에 null 이 아님을 보장
      },
    );
  }

  Widget submitButton() {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.blue[300],
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: const Text('submit'),
      onPressed: () {
        if (!_formKey.currentState!.validate()) {
          debugPrint('*** validation is failed!');
        } else {
          _formKey.currentState!.save();
          ScaffoldMessenger.of(context).showSnackBar(
            // const SnackBar(content: Text('Processing Data')),
            SnackBar(content: Text('Time to login by $email and $password')),
          );
        }
      },
    );
  }
}
