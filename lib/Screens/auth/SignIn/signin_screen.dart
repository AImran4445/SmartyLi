// import 'package:path/path.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import '../../../Homepage.dart';
// import '../SignUp/SignUpScreen.dart';
// import '../SignUp/reusable_widgets.dart';
// import 'color_utils.dart';

// class SignInScreen extends StatefulWidget {
//   SignInScreen({super.key});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   TextEditingController _passwordTextcontroller = TextEditingController();
//   TextEditingController _emailTextcontroller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: SingleChildScrollView(
//             child: Padding(
//           padding: EdgeInsets.fromLTRB(
//               10, MediaQuery.of(context).size.height * 0.1, 15, 1),
//           child: Column(children: <Widget>[
//             logowidget("assets/images/login.png"),
//             // Text(
//             //   "Login Into Your Account",
//             //    style: TextStyle(color: hexStringToColor("5E61F4") )) ,
//             SizedBox(
//               height: 40,
//             ),
//             reusableTextField("Enter userName", Icons.person_outline, false,
//                 _emailTextcontroller),
//             SizedBox(
//               height: 40,
//             ),
//             reusableTextField("Enter password", Icons.lock_outline, true,
//                 _passwordTextcontroller),
//             SizedBox(
//               height: 50,
//             ),
//             signInSignUpButton(context, true),
//             signUpOption(context)
//           ]),
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

// Container signInSignUpButton(
//     BuildContext context, bool isLogin) {
//   return Container(
//     width: MediaQuery.of(context).size.width,
//     height: 50,
//     margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
//     decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
//     child: ElevatedButton(
//       onPressed: () {
//         Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Homepage()),
//               );
//       },
//       child: Text(
//         isLogin ? 'Log In' : 'Sign Up',
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

// Row signUpOption(context) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text("Don't have account?",
//           style: TextStyle(color: hexStringToColor("5E61F4"))),
//       GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => SignUpScreen()),
//           );
//         },
//         child: const Text(
//           " Sign Up",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       )
//     ],
//   );
// }
