//import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_twitter_login/flutter_twitter_login.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'auth sample',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: AuthPage(
//        title: 'Auth Sample with Firebase',
//      ),
//    );
//  }
//}
//
//class AuthPage extends StatefulWidget {
//  AuthPage({
//    Key key,
//    this.title,
//  }) : super(
//    key: key,
//  );
//
//  final String title;
//
//  @override
//  _AuthPageState createState() => _AuthPageState();
//}
//
//class _AuthPageState extends State {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//
//  // APIキーを入力
//  final TwitterLogin twitterLogin = TwitterLogin(
//    consumerKey: consumerKey,
//    consumerSecret: secretkey,
//  );
//
//  bool logined = false;
//
//  void login() {
//    setState(() {
//      logined = true;
//    });
//  }
//
//  void logout() {
//    setState(() {
//      logined = false;
//    });
//  }
//
//  Future signInWithTwitter() async {
//    // twitter認証の許可画面が出現
//    final TwitterLoginResult result = await twitterLogin.authorize();
//
//    //Firebaseのユーザー情報にアクセス & 情報の登録 & 取得
//    final AuthCredential credential = TwitterAuthProvider.getCredential(
//      authToken: result.session.token,
//      authTokenSecret: result.session.secret,
//    );
//
//    //Firebaseのuser id取得
//    final FirebaseUser user =
//        (await _auth.signInWithCredential(credential)).user;
//
//    assert(!user.isAnonymous);
//    assert(await user.getIdToken() != null);
//
//    final FirebaseUser currentUser = await _auth.currentUser();
//    assert(user.uid == currentUser.uid);
//
//    login();
//  }
//
//  void signOutTwitter() async {
//    await twitterLogin.logOut();
//    logout();
//    print("User Sign Out Twittter");
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    Widget logoutText = Text("ログアウト中");
//    Widget loginText = Text("ログイン中");
//
//    Widget loginBtnTwitter = RaisedButton(
//      child: Text("Sign in with Twitter"),
//      color: Color(0xFF1DA1F2),
//      textColor: Colors.white,
//      onPressed: signInWithTwitter,
//    );
//    Widget logoutBtnTwitter = RaisedButton(
//      child: Text("Sign out with Twitter"),
//      color: Color(0xFF1DA1F2),
//      textColor: Colors.white,
//      onPressed: signOutTwitter,
//    );
//
//    return Scaffold(
//      appBar: AppBar(
//        centerTitle: true,
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            logined ? loginText : logoutText,
//            logined ? logoutBtnTwitter : loginBtnTwitter,
//          ],
//        ),
//      ),
//    );
//  }
//}
