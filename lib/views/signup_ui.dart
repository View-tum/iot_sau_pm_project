import 'package:flutter/material.dart';
import 'package:iot_sau_pm_project/models/user.dart';
import 'package:iot_sau_pm_project/sevices/call_user_api.dart';

class SignupUI extends StatefulWidget {
  const SignupUI({super.key});

  @override
  State<SignupUI> createState() => _SignupUIState();
}

class _SignupUIState extends State<SignupUI> {
  //สร้างตัวแปลเปิดปิดรหัสผ่าน
  bool pwdVisible = true;

  TextEditingController userFullnameCtrl = TextEditingController();
  TextEditingController userEmailCtrl = TextEditingController();
  TextEditingController userPasswordCtrl = TextEditingController();
  TextEditingController userNameCtrl = TextEditingController();

  void showWarningMSG(context, msg) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'คำเตือน',
          textAlign: TextAlign.center,
        ),
        content: Text(
          msg,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'ตกลง',
            ),
          ),
        ],
      ),
    );
  }

  Future showCompleteMSG(context, msg) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'ผลการทำงาน',
          textAlign: TextAlign.center,
        ),
        content: Text(
          msg,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'ตกลง',
            ),
          ),
        ],
      ),
    );
  }

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
                controller: userFullnameCtrl,
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
                controller: userEmailCtrl,
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
                controller: userNameCtrl,
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
                controller: userPasswordCtrl,
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
                onPressed: () {
                  if (userFullnameCtrl.text.isEmpty) {
                    showWarningMSG(context, 'กรุณากรอกชื่อ-นามสกุล');
                  } else if (userEmailCtrl.text.isEmpty) {
                    showWarningMSG(context, 'กรุณากรอกอีเมล');
                  } else if (userNameCtrl.text.isEmpty) {
                    showWarningMSG(context, 'กรุณากรอกชื่อผู้ใช้');
                  } else if (userPasswordCtrl.text.isEmpty) {
                    showWarningMSG(context, 'กรุณากรอกรหัสผ่าน');
                  } else {
                    User user = User(
                      userFullname: userFullnameCtrl.text,
                      userEmail: userEmailCtrl.text,
                      userName: userNameCtrl.text,
                      userPassword: userPasswordCtrl.text,
                    );
                    CallUserAPI.insertUserAPI(user).then((value) {
                      if (value[0].message == "1") {
                        showCompleteMSG(context, "ลงทะเบียนสําเร็จ")
                            .then((value) => Navigator.pop(context));
                      } else {
                        showWarningMSG(context, "ลงทะเบียนไม่สำเร็จ");
                      }
                    });
                  }
                },
                child: Text(
                  'Signup',
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
