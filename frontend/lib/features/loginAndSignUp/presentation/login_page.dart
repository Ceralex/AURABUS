import 'package:aurabus/features/loginAndSignUp/widgets/clickable_text.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/generic_button.dart';
import 'package:aurabus/features/loginAndSignUp/widgets/custom_text_field.dart';
import 'package:aurabus/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});
  @override
  State<StatefulWidget> createState()   => _LoginPageState();

}

class _LoginPageState extends State<LoginPage>
{
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

    @override
    void dispose() {
      emailController.dispose();
      passwordController.dispose();
      super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children:[
              Center(
              child:Container(
                margin: const EdgeInsets.only(top:70),
              child: Column
              (
                children:[ 
         
                  Text("AURABUS",style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold ),),
                  Text("LogIn",style:TextStyle(fontSize: 13, fontWeight: FontWeight.w300 ,color:Theme.of(context).colorScheme.secondary  ),),

                  const SizedBox(height: 70),

                  CustomTextField(textlabel: 'EMAIL',controller: emailController),
                  CustomTextField(textlabel: 'PASSWORD', obscuretext:true,controller: passwordController),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child:Clickabletext(
                      textlabel: "forgot your password?", 
                      fun: () => () {}),
                  ),

                  Genericbutton(textlabel: 'Login'),

                ]
                ),

              )
            ),
              Align(
                    alignment: Alignment.bottomCenter,
                    child: (Clickabletext(textlabel: "Don't have an account? Sign up", fun: () => context.go(AppRoute.signup)))
                  )
            ]

          )
          
        );
  }
}


