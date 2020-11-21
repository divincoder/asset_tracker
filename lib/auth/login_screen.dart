import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helper_widgets/empty_space.dart';
import 'package:helper_widgets/responsive/responsive_builder.dart';
import 'package:helper_widgets/validators.dart';
import 'package:spending_tracker/app_colors.dart';
import 'package:spending_tracker/demo.dart';
import 'package:spending_tracker/widgets/c_button.dart';
import 'package:spending_tracker/widgets/c_textform_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool obscurePassword = true;
  bool _loading = false;

  var autoValidate = false;
  var email;
  var password;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white70,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Image.asset("images/fsdh_asset.png"),
              Expanded(
                child: ResponsiveBuilder(
                    builder: (context, deviceInfo) => Form(
                          key: formKey,
                          child: SingleChildScrollView(
                            child: Container(
                              height: deviceInfo.screenHeight,
                              width: deviceInfo.screenWidth,
                              padding: EdgeInsets.all(24.0),
                              color: Colors.white70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
//                                  EmptySpace(multiple: 4),
                                      Text(
                                        "LOG IN",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: AppColors.primary,
                                          fontFamily: 'TitilliumWeb',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      EmptySpace(multiple: 5),

                                      CTextFormField(
                                        labelText: 'Email Address',
                                        autoValidate: autoValidate,
                                        validator: Validators.validateEmail(),
                                        onSaved: (value) {
                                          email = value;
                                        },
                                      ),
                                      EmptySpace(multiple: 3),
                                      CTextFormField(
                                        obscureText: obscurePassword,
                                        isLastTextField: true,
                                        labelText: 'Password',
                                        autoValidate: autoValidate,
                                        trailingIcon: InkWell(
                                            onTap: () {
                                              setState(() {
                                                obscurePassword =
                                                    !obscurePassword;
                                              });
                                            },
                                            child: Icon(
                                              obscurePassword
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.black45
                                                  .withOpacity(0.7),
                                              size: 20,
                                            )),
                                        validator: Validators.validatePlainPass(
                                            minLength: 4),
                                        onSaved: (value) {
                                          password = value;
                                        },
                                      ),
                                      EmptySpace(multiple: 5),
                                    ],
                                  ),
                                  CButton(
                                      showProgress: _loading,
                                      title: "Continue",
                                      onPressed: () {
                                       login();
                                      }),
                                  FlatButton(
                                      onPressed: () {
                                        scaffoldKey.currentState
                                            .showSnackBar(SnackBar(
                                          content: Text("Not available"),
                                          backgroundColor:
                                              AppColors.colorAccent0,
                                        ));
                                      },
                                      child: Text("Forgot Password?"))
                                ],
                              ),
                            ),
                          ),
                        )),
              ),
            ],
          ),
        ));
  }

  login() {
    if(formKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });
      Future.delayed(Duration(seconds: 3),
              () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SpendingTrackerDemo()));
          });
    }
  }

}
