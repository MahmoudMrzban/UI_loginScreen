import 'package:flutter/material.dart';
import 'package:login_screen/check.dart';
import 'package:login_screen/home.dart';
import 'package:login_screen/signup_page.dart';

class firstScreen extends StatefulWidget {
  const firstScreen({super.key});

  @override
  State<firstScreen> createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {
  
  bool _obsecure = true;
  final GlobalKey <FormState> field=GlobalKey();
  String Email='';
  String Pass='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Colors.lightBlue,
                    image: DecorationImage(image: AssetImage('assets/login.webp'),
                    scale: 3.5,
                    ),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(60),
                     bottomLeft: Radius.circular(60))
                  ),
                ),
                Form(
                  key: field,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                          height: 30,
                        ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value){
                        if (value!.isEmpty) {
                          return "Please Enter Your Email";
                        }
                        return null;
                      },
                      onSaved: (value){
                        Email = value!;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                       prefixIcon: Icon(Icons.email,color: Colors.lightBlue,
                       ),
                          label: Text('Email',style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color:Color(0xffB81736),
                          )
                          ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      validator: (value){
                        if (value!.isEmpty) {
                          return "Please Enter Your Password";
                        }
                        return null;
                      },
                      onSaved: (value){
                        Pass = value!;
                      },
                      obscureText: _obsecure,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline_rounded,
                        color: Colors.lightBlue,
                        ),
                        label: const Text('Password',
                        style: TextStyle(
                          color:Color(0xffB81736),
                          fontWeight: FontWeight.w300,
                        ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: IconButton(
                          onPressed: (){
                          setState(() {
                            setState(() {
                              _obsecure =! _obsecure;
                            });
                          });
                        },
                        icon:  _obsecure? const Icon(Icons.visibility,
                        color: Colors.lightBlue,
                        ) : const Icon(Icons.visibility_off)
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 280,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                          elevation: 20,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: (){  
                          setState(() {
                            field.currentState!.save();
                            if (field.currentState!.validate()) {
                            if (isLoginValid(Email, Pass)) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => const Home()),
                                  );
                            }
                            else
                            {
                             showDialog(context: context, 
                             builder: (BuildContext context) {
                              return const AlertDialog(
                              title: Text('Faild Login'),
                              );
                             }
                             );
                            }
                          }
                          });
                         },  
                      child: const Text('LOGIN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text("Don't have an account",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      ),
                      const SizedBox(
                    width: 8,
                  ),
                      InkWell(
                        child: const Text("SIGN UP",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                        ),
                        onTap: (){
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => const signup()),
                                  );
                        },
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 120,
                      ),
                      Container(
                  width: double.infinity,
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(60),
                     topLeft: Radius.circular(60))
                  ),
                ),
                    ],
                  )
                ],
              ),
            ),
              ],
            ),
      ),
      );
  }
}