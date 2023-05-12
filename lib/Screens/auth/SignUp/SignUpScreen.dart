// import 'package:flutter/material.dart';
// import 'package:home/Screens/auth/SignIn/color_utils.dart';

// import '../SignIn/reusable_widgets.dart';
// import '../SignIn/signin_screen.dart';


// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//  TextEditingController _passwordTextcontroller = TextEditingController();
//  TextEditingController _emailTextcontroller = TextEditingController();
//  TextEditingController _userNameTextController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: SingleChildScrollView(child: Padding(padding: EdgeInsets.fromLTRB( 10, MediaQuery.of(context).size.height * 0.1, 15, 1),
//          child: Column(
//               children: <Widget>[
//                 logowidget("assets/images/signup.png"),
//                 Text(
//                   "Register Your Account",
//                    style: TextStyle(color: hexStringToColor("5E61F4") )) ,
//                    SizedBox(
//                   height: 30,
//                 ),
//                 reusableTextField("Enter userName", Icons.lock_outline, true, _userNameTextController),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 reusableTextField("Enter Email", Icons.person_outline, false, _emailTextcontroller),

//                 SizedBox(
//                   height: 30,
//                 ),
//                 reusableTextField("Enter password", Icons.lock_outline, true, _passwordTextcontroller),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 signInSignUpButton(context, true, (){}),
//                 signInOption(context)
//               ]
              

//         ),
//         )),
        
//       ),
      
//     );
//   }

  
// }   
// TextField reusableTextField(String text, IconData icon, bool isPasswordType,
//     TextEditingController controller) {
//   return TextField(
//     controller: controller,
//     obscureText: isPasswordType,
//     enableSuggestions: !isPasswordType,
//     autocorrect: !isPasswordType,
//     cursorColor: Colors.grey[100],
//     style: TextStyle(color: Colors.black.withOpacity(0.9)),
//     decoration: InputDecoration(
//       prefixIcon: Icon(
//         icon,
//         color: Colors.black,
//       ),
//       labelText: text,
//       labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
//       filled: true,
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       fillColor: Colors.grey[350],
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.0),
//           borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
//     ),
//     keyboardType: isPasswordType
//         ? TextInputType.visiblePassword
//         : TextInputType.emailAddress,
//   );
// }

// Container signInSignUpButton(BuildContext context, bool isSignUp, Function onTap) {
//   return Container(
//     width: MediaQuery.of(context).size.width,
//     height: 50,
//     margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
//     decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
//     child: ElevatedButton(
//       onPressed: () {
//        Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SignInScreen()),
//                 );
//       },
//       child: Text(
//         isSignUp ? 'Sign Up' : 'Log In',
//         style: const TextStyle(
//             color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
//       ),
//       style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.resolveWith((states) {
//             if (states.contains(MaterialState.pressed)) {
//               return Colors.black26;
//             }
//             return hexStringToColor("5E61F4");
//           }),
//           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
//     ),
//   );
// }

//   Row signInOption(context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//        Text("Already Have an Account? Log In",
//             style: TextStyle(color: hexStringToColor("5E61F4"))),
//         GestureDetector(
//           onTap: (){
//             Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SignInScreen()),
//                 );
//           },
//           child: const Text(
//             " Login In",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         )
//       ],
//     );
//   }
