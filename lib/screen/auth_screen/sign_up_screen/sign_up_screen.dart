import 'package:flutter/material.dart';
import 'package:texx/config/color_constants.dart';
import 'package:texx/widgets/button_widget.dart';
import 'package:texx/widgets/full_width_btn.dart';
import 'package:texx/widgets/text_form_field_widget.dart';

//회원가입 화면
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  final _key = GlobalKey<FormState>();
  late String _email = '', _password = '', _rePassword = '';
  late bool isTermsAgreed; // 서비스 이용약관 동의
  late bool isPrivacyAgreed; // 개인정보 처리방침 동의
  late bool isMarketingAgreed; // 마케팅 정보 수신 동의
  late bool isAllAgreed; // 전체 동의

  @override
  void initState() {
    super.initState();
    isTermsAgreed = false;
    isPrivacyAgreed = false;
    isMarketingAgreed = false;
    isAllAgreed = false;
  }

  void signUp() {
    print(_email);
    print(_password);
    print(_rePassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24), // 여백 증가
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50), // 상단 여백
                // 타이틀
                const Text(
                  '회원가입',
                  style: TextStyle(
                    fontSize: 20, // 크기 증가
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 25), // 타이틀과 폼 사이 간격 증가

                // 입력 폼
                Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputField('이메일', 'email'),
                      const SizedBox(height: 24),
                      _buildInputField('비밀번호', 'password'),
                      const SizedBox(height: 24),
                      _buildInputField('비밀번호 재입력', 'rePassword'),
                    ],
                  ),
                ),

                const SizedBox(height: 40), // 폼과 약관 사이 간격

                // 약관 동의 섹션
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildCheckboxTile(
                        '전체 동의',
                        isAllAgreed,
                        (value) {
                          setState(() {
                            isTermsAgreed = value ?? false;
                            isPrivacyAgreed = value ?? false;
                            isMarketingAgreed = value ?? false;
                            isAllAgreed = value ?? false;
                          });
                        },
                        isBold: true,
                      ),
                      const Divider(color: Colors.white24, height: 24),
                      _buildCheckboxTile(
                        '서비스 이용약관 동의 (필수)',
                        isTermsAgreed,
                        (value) => setState(() {
                          isTermsAgreed = value ?? false;
                          isAllAgreed = isTermsAgreed &&
                              isPrivacyAgreed &&
                              isMarketingAgreed;
                        }),
                      ),
                      _buildCheckboxTile(
                        '개인정보 처리방침 동의 (필수)',
                        isPrivacyAgreed,
                        (value) => setState(() {
                          isPrivacyAgreed = value ?? false;
                          isAllAgreed = isTermsAgreed &&
                              isPrivacyAgreed &&
                              isMarketingAgreed;
                        }),
                      ),
                      _buildCheckboxTile(
                        '마케팅 정보 수신 동의 (선택)',
                        isMarketingAgreed,
                        (value) => setState(() {
                          isMarketingAgreed = value ?? false;
                          isAllAgreed = isTermsAgreed &&
                              isPrivacyAgreed &&
                              isMarketingAgreed;
                        }),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40), // 약관과 버튼 사이 간격

                // 회원가입 버튼
                FullWidthBtn(
                  type: 'Elevated',
                  title: const Text(
                    '회원가입',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  margin: EdgeInsets.zero,
                  color: ColorConstants.btnPrimary,
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();
                      signUp();
                    }
                  },
                ),
                const SizedBox(height: 24), // 하단 여백
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 입력 필드 위젯 생성 메소드
  Widget _buildInputField(String label, String type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 8),
        TextFormFieldWidget(
          type: type,
          onSaved: (value) {
            switch (type) {
              case 'email':
                _email = value as String;
                break;
              case 'password':
                _password = value as String;
                break;
              case 'rePassword':
                _rePassword = value as String;
                break;
            }
          },
        ),
      ],
    );
  }

  // 체크박스 타일 위젯 생성 메소드
  Widget _buildCheckboxTile(
    String title,
    bool value,
    Function(bool?) onChanged, {
    bool isBold = false,
  }) {
    return CheckboxListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: TextStyle(
          fontSize: isBold ? 16 : 14,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: Colors.white,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      dense: true,
      activeColor: ColorConstants.textGray,
    );
  }
}
