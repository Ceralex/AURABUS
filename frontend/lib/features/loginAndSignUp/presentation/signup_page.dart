import 'package:aurabus/features/loginAndSignUp/widgets/clickable_text.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/generic_button.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/google_button.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/terms_and_conditons.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/custom_text_field.dart';
import 'package:aurabus/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {

  const SignupPage({super.key});
  @override
  State<StatefulWidget> createState()   => _SignupPageState();

}

class _SignupPageState extends State<SignupPage>
{

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool termsChecked = false;



  @override
  void dispose() {
      firstNameController.dispose();
      lastNameController.dispose();
      emailController.dispose();
      passwordController.dispose();
      confirmPasswordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
          backgroundColor: const Color.fromARGB(255, 242, 242, 242),
          body: Stack(
            children: 
            [
              SingleChildScrollView(
              child:Center(
                child:Container(
                  margin: const EdgeInsets.only(top:40),
                  child: Column
                  (
                  children:[ 
                    Text("AURABUS",style:GoogleFonts.ubuntu(fontSize: 30, fontWeight: FontWeight.bold ),),
                    Text("SignUp",style:GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w300 ,color: Colors.grey ),),
                    const SizedBox(height: 50-27),

                    Row(children:[
                      Expanded(child: CustomTextField(textlabel: 'FIRST NAME' , controller: firstNameController, margin: EdgeInsets.only(top: 7, bottom: 7,left: 20,right:5),)),
                      Expanded(child: CustomTextField(textlabel: 'LAST NAME'  ,  controller: lastNameController, margin: EdgeInsets.only(top: 7, bottom: 7,left: 5,right:20),)),

                      ]),
                    CustomTextField(textlabel: 'EMAIL', controller: emailController),
                    CustomTextField(textlabel: 'PASSWORD', obscuretext:true , controller: passwordController),
                    CustomTextField(textlabel: 'CONFIRM PASSWORD', obscuretext:true, controller: confirmPasswordController),

                    TermsAndCOnditions(isChecked: termsChecked, onChanged: (bool? value) 
                    {
                      setState(() {termsChecked = value ?? false;});
                    },),

                    Genericbutton(textlabel: 'Sign-Up'),
                    Googlebutton(height: 40, width: 120),
                    ]
                    )
                  )
                ),
              ),
              Align(
                    alignment: Alignment.bottomCenter,
                    child: (Clickabletext(textlabel: "Do you already have an account? Log in", fun: () => context.go(AppRoute.login)))
                  )
            ]
          )
          
          
        );
  }
}


