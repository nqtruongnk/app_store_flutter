import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_flutter/views/register/text_form_field.dart';

class RegisterView extends StatefulWidget {
  RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailCrl = TextEditingController();
  TextEditingController passCrl = TextEditingController();
  TextEditingController confirmPassCrl = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff009acd),
            Color(0xD9009acd),
          ], begin: Alignment.topLeft, end: Alignment.centerRight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 36,
                      horizontal: 24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Signup',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 46,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Enter to a beautiful World',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InputTextField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter text';
                                }
                                return null;
                              },
                              controller: emailCrl,
                              hintText: 'E - mail',
                              prefixIcon: Icon(Icons.email),
                              suffixIcon: null,
                            ),

                            InputTextField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter text';
                                }
                                return null;
                              },
                              controller: passCrl,
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock_open),
                              suffixIcon: true,
                            ),
                            InputTextField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter text';
                                }
                                return null;
                              },
                              controller: confirmPassCrl,
                              hintText: 'Confirm Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: true,
                            ),

                            SizedBox(
                              height: 50,
                            ),
                            // ignore: deprecated_member_use
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              padding: EdgeInsets.symmetric(
                                horizontal: 147,
                                vertical: 15,
                              ),
                              child: Text('Signup',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                              textColor: Colors.white,
                              color: Colors.blue[800],
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {}
                                await _auth.createUserWithEmailAndPassword(
                                    email: emailCrl.text,
                                    password: passCrl.text);
                                Navigator.pop(context, {
                                  'username': emailCrl.text,
                                  'password': passCrl.text
                                });
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Have an account? ',
                                  style: TextStyle(
                                      color: Colors.blue[800],
                                      fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Signup ',
                                    style: TextStyle(
                                        color: Colors.blue[800],
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
