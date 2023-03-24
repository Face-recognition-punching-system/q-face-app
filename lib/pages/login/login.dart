import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  late String _account = "", _password = "";
  bool _isObscure = true;
  Color _eyeColor = Colors.grey;
  final _regexp = RegExp(r"\w(?=.*[a-zA-Z])(?=.*\d){7,15}");
  getAccountError(){
    if(_account == ""){
      return null;
    }

    if(_regexp.hasMatch(_account)){
      return null;
    }else{
      return "账号格式错误";
    }
  }

  getPasswordError(){
    if(_password == ""){
      return null;
    }

    if(_regexp.hasMatch(_password)){
      return null;
    }else{
      return "密码格式错误";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: kToolbarHeight),
            close(),
            title(),
            titleLine(),
            const SizedBox(height: 60),
            accountTextField(),
            const SizedBox(height: 30),
            passwordTextField(context),
            forgetPasswordText(context),
            const SizedBox(height: 60),
            loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget close() {
    return Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }

  Widget title() {
    return const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          '员工登陆',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ));
  }

  Widget titleLine() {
    return Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 4.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            color: Colors.black,
            width: 40,
            height: 2,
          ),
        ));
  }

  Widget accountTextField() {
    return TextField(
      autofocus: true,
      maxLength: 16,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          labelText: '账号',
          hintText: '请输入账号',
          errorText: getAccountError()),
      onChanged: (v) {
        setState(() {
          _account = v;
        });
        if (kDebugMode) {
          print("onChange: $v");
        }
      },
    );
  }

  Widget passwordTextField(BuildContext context) {
    return TextField(
      obscureText: _isObscure,
      maxLength: 16,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          labelText: "密码",
          hintText: '请输入密码',
          errorText: getPasswordError(),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: _eyeColor,
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
                _eyeColor = (_isObscure
                    ? Colors.grey
                    : Theme.of(context).iconTheme.color)!;
              });
            },
          )),
      onChanged: (v) {
        setState(() {
          _password = v;
        });
        if (kDebugMode) {
          print("onChange: $v");
        }
      },
    );
  }

  Widget forgetPasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            if (kDebugMode) {
              print("忘记密码");
            }
          },
          child: const Text("忘记密码？",
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45,
        width: 270,
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(const StadiumBorder(
                  side: BorderSide(style: BorderStyle.none)))),
          child: Text('登陆',
              style: Theme.of(context).primaryTextTheme.headlineSmall),
          onPressed: () {
            if (_regexp.hasMatch(_account) && _regexp.hasMatch(_password)) {
              //TODO 执行登录方法
              if (kDebugMode) {
                print('email: $_account, password: $_password');
              }
            }
          },
        ),
      ),
    );
  }
}
