// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class SignupUI extends StatefulWidget {
  const SignupUI({super.key});

  @override
  State<SignupUI> createState() => _SignupUIState();
}

class _SignupUIState extends State<SignupUI> {
  //สร้างตัวแปลเปิดปิดรหัสผ่าน
  bool pwdVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(
          'Signup PM APP',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ชื่อ-นามสกุล',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Fullname',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  prefixIcon: Icon(
                    Icons.list_alt,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'อีเมล',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'E-mail',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  prefixIcon: Icon(
                    Icons.mail,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ชื่อผู้ใช้',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'รหัสผ่าน',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TextField(
                obscureText: pwdVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      //codeทีมีผลต่่อการแสดวงผลให้เขียนอยู่ใน setstate
                      setState(() {
                        pwdVisible = !pwdVisible;
                      });
                    },
                    icon: Icon(
                      //ternary operator ___?____:____
                      pwdVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Signin',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: Size(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
