import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}



//HOMEPAGE
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //intilize firebase app
  Future<FirebaseApp>_initlizeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: _initlizeFirebase(),
          builder: (context, snapshot ){
            if(snapshot.connectionState == ConnectionState.done){
              return LoginScreeen();
            }
            return const Center(
              child: CircularProgressIndicator(
              ),
            );
          },
        )
    );
  }
}


//Login screen
class LoginScreeen extends StatefulWidget {
  const LoginScreeen({Key? key}) : super(key: key);

  @override
  State<LoginScreeen> createState() => _LoginScreeenState();
}

class _LoginScreeenState extends State<LoginScreeen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Text(
            'Buisness For You',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 26
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Login to App',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Enter Email',
              prefixIcon: Icon(Icons.mail),
              focusColor: Colors.blueGrey,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock),
              focusColor: Colors.blueGrey,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Forgotten your Pasword?',
            style: TextStyle(
                color: Colors.blue
            ),
          ),
          const SizedBox(
            height: 55,
          ),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: Colors.pinkAccent,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 20,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              onPressed: (){},
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
