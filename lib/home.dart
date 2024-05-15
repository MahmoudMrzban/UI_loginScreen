import 'package:flutter/material.dart';
import 'package:login_screen/login.dart';
import 'package:login_screen/main.dart';

void main(){
  runApp( const MyApp());
}
class Home extends StatefulWidget {
     const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/open.jpg')
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
               const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Successfully Login',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Icon(Icons.lock_open_rounded ,
                    size: 40,
                    color: Colors.blueGrey,
                    ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        fixedSize: const Size(300, 60),
                      ),
                      onPressed: (){
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => const firstScreen()),
                        );
                      }, 
                    child: const Text('Back To Login Page',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                    )
                    ),
            ],
          ),
        ),
      );
  }
}