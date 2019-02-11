import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:vplay/src/store/models/models.dart';
import 'package:vplay/src/store/actions/actions.dart';
import 'package:vplay/src/components/modal_stack.dart';
import 'package:vplay/src/components/modal_dialog.dart';
import 'package:vplay/src/utils/authentication.dart';

class LoginPage extends StatefulWidget {
  static String tag = "/login_page";

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final key = GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      converter: (Store<AppState> store) => store,
      builder: (context, store) => Scaffold(
            appBar: AppBar(
              title: Text("Login"),
            ),
            body: ModalStack(
              isLoading: store.state.isLoading,
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  padding: EdgeInsets.all(20.0),
                  children: <Widget>[
                    Text(
                      'LOGIN FORM',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Form(
                      key: key,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "xxx@gmail.com",
                              labelText: "Email",
                              icon: Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                            ),
                            onSaved: (value) {
                              email = value;
                            },
                            validator: (value) {
                              if (value.length <= 0) {
                                return "Email is required";
                              }
                              Pattern pattern =
                                  r'^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$';
                              RegExp rgx = RegExp(pattern);
                              if (!rgx.hasMatch(value)) {
                                return "Email is not valid";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Password",
                                hintText: "secret",
                                icon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.grey,
                                ),
                              ),
                              onSaved: (value) {
                                password = value;
                              },
                              validator: (value) {
                                if (value.length <= 0) {
                                  return "Password is required";
                                }
                                return null;
                              }),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: RaisedButton(
                              child: Text("Login"),
                              color: Colors.purple,
                              textColor: Colors.white,
                              onPressed: () async {
                                if (key.currentState.validate()) {
                                  key.currentState.save();
                                  store.dispatch(AuthUserOnLoadAction());
                                  try {
                                    FirebaseUser user = await signInByEmail(
                                        this.email, this.password);
                                    AuthUser authUser = AuthUser(
                                      email: user.email,
                                      provideId: user.providerId,
                                      photoUrl: user.photoUrl,
                                      displayName: user.displayName,
                                      uid: user.uid,
                                      phoneNumber: user.phoneNumber,
                                    );
                                    store.dispatch(
                                        AuthUserLoadedAction(authUser));
                                    Navigator.of(context)
                                        .pushReplacementNamed("/home_page");
                                  } catch (e) {
                                    store.dispatch(AuthUserFailedAction());
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ModalDialog(
                                          title: "FAILED",
                                          content: e.toString(),
                                        );
                                      },
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(50.0),
                      child: RaisedButton(
                        color: Colors.blue[900],
                        textColor: Colors.white,
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          textDirection: TextDirection.ltr,
                          children: <Widget>[
                            Icon(
                              Icons.account_circle,
                              color: Colors.white,
                            ),
                            Text(" Sign with google")
                          ],
                        ),
                        onPressed: () async {
                          try {
                            FirebaseUser user = await signInByGoogle();
                            AuthUser authUser = AuthUser(
                              email: user.email,
                              provideId: user.providerId,
                              photoUrl: user.photoUrl,
                              displayName: user.displayName,
                              uid: user.uid,
                              phoneNumber: user.phoneNumber,
                            );
                            store.dispatch(AuthUserLoadedAction(authUser));
                            Navigator.of(context)
                                .pushReplacementNamed("/home_page");
                          } catch (error) {
                            print(error);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
