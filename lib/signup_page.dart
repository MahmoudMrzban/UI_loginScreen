import 'package:flutter/material.dart';
import 'package:login_screen/login.dart';
import 'package:login_screen/check.dart';


class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<signup> {
  
  final GlobalKey <FormState> field=GlobalKey();
  bool _obsecure = true;
  String firstName='';
  String lastName='';
  String Email='';
  String Pass='';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: field,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 160,
                ),
                TextFormField(
                  onSaved: (value) {
                      firstName = value!;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person,color: Colors.lightBlue,
                    ),
                    suffixIcon: const Icon(Icons.star_rate_rounded,
                    color: Colors.redAccent,),
                     label: const Text('First Name',style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black26,
                                )
                                ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                 TextFormField(
                  onSaved: (value){
                  lastName = value!;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person,color: Colors.lightBlue,
                    ),
                    suffixIcon: const Icon(Icons.star_rate_rounded,
                    color: Colors.redAccent,),
                     label: const Text('Last Name',style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black26,
                                )
                                ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                 TextFormField(
                  onSaved: (value){
                  Email = value!;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person,color: Colors.lightBlue,
                    ),
                    suffixIcon: const Icon(Icons.star_rate_rounded,
                    color: Colors.redAccent,),
                     label: const Text('Email',style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black26,
                                )
                                ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
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
                              color:Colors.black26,
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
                            color: Colors.redAccent,
                            ) : const Icon(Icons.visibility_off)
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            fixedSize: const Size(300, 60),
                          ),
                          onPressed: (){
                            setState(() {
                              field.currentState!.save();
                            if (Email.isNotEmpty && Pass.isNotEmpty) {
                                setState(() {
                                  Logins[Email] = Pass;
                                  print(Logins);
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (context) => const firstScreen()),
                                  );
                                });
                              }
                            });
                            
                          }, 
                        child: const Text('SIGNUP',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                        )),
                        const SizedBox(
                          height: 30,
                        ),
                        // ElevatedButton(
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: Colors.lightBlue,
                        //     fixedSize: const Size(300, 60),
                        //   ),
                        //   onPressed: (){
                        //     Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //     builder: (context) => const firstScreen()),
                        //     );
                        //   }, 
                        // child: const Text('Back To Login Page',
                        // style: TextStyle(
                        //   fontSize: 24,
                        //   color: Colors.white,
                        // ),
                        // )),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}