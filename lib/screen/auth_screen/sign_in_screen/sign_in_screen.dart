import 'package:flutter/material.dart';
import 'package:texx/config/color_constants.dart';
import 'package:texx/widgets/button_widget.dart';
import 'package:texx/widgets/full_width_btn.dart';
import 'package:texx/widgets/text_form_field_widget.dart';
import 'package:texx/config/route.dart'; // Routes 클래스 import 추가

//로그인 메인 화면
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignInState();
}

class _SignInState extends State<SignInScreen> {
  final _key = GlobalKey<FormState>();
  late String _email = '', _password = '';

  @override
  void initState() {
    super.initState();
  }

  void login() {
    print(_email);
    print(_password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Builder(builder: (context) {
          //다른 곳을 터치하면 키보드가 사라지게 하기 위한 코드
          return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              //키보드가 올라와도 화면을 가리지 않게 하기 위한 코드
              child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SafeArea(
                      child: SizedBox(
                          height:
                              MediaQuery.of(context).size.height, // 화면 전체 높이
                          child: Center(
                              // Center 위젯 추가
                              child: Form(
                                  key: _key,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/logo.jpeg',
                                        width: 200,
                                        height: 200,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      //이메일 입력 폼
                                      Container(
                                        margin: const EdgeInsets.only(top: 20),
                                        child: TextFormFieldWidget(
                                            type: 'email',
                                            onSaved: (email) =>
                                                _email = email as String),
                                      ),
                                      //비밀번호 입력 폼
                                      Container(
                                          margin: const EdgeInsets.only(
                                              top: 10, bottom: 15),
                                          child: TextFormFieldWidget(
                                              type: 'password',
                                              onSaved: (password) => _password =
                                                  password as String)),
                                      FullWidthBtn(
                                        type: 'Elevated',
                                        title: const Text(
                                          '로그인',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                        margin: EdgeInsets.zero,
                                        color: ColorConstants.textGray,
                                        onPressed: () => {
                                          //유효성 검사
                                          if (_key.currentState!.validate())
                                            {_key.currentState!.save(), login()}
                                        },
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ButtonWidget(
                                              type: 'Text',
                                              text: const Text(
                                                '비밀번호 찾기',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pushNamed(context,
                                                      '/find_password')),
                                          ButtonWidget(
                                              type: 'Text',
                                              text: const Text(
                                                '회원가입',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pushNamed(
                                                      context, Routes.signUp)),
                                        ],
                                      )
                                    ],
                                  )))))));
        }));
  }
}
