import 'package:chat/widgets/boton_azul.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:flutter/material.dart';



  @override
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height*0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[
                 Logo(titulo: 'Registro'),
                _Form(),
                const Labels(ruta:'login', texto1:'¿Ya tienes una cuenta?',texto2:'Ingresa ahora!!'),
            
                const Text('Términos y condiciones de uso', style: TextStyle(fontWeight:FontWeight.w200 )),
              ] 
                 ),
          ),
        ),
      ),
   );
  }
}







class _Form extends StatefulWidget {

  @override
  State<_Form> createState() => __FormState();
}
class __FormState extends State<_Form> {

 final nombreCtrl = TextEditingController();
 final emailCtrl = TextEditingController();
 final passCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:40),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child:  Column(
        children:<Widget> [
          CustomInput(
          icon:Icons.perm_identity,
          placeholder: 'Nombre',
          keyboardType: TextInputType.text,
          textController: nombreCtrl,
         ),
          
         CustomInput(
          icon:Icons.mail_outlined,
          placeholder: 'Correo',
          keyboardType: TextInputType.emailAddress,
          textController: emailCtrl,
         ),

         CustomInput(
          icon:Icons.lock_outlined,
          placeholder: 'Contraseña',
          //keyboardType: TextInputType.emailAddress,
          textController: passCtrl,
          isPassword: true,
         ),
        
          // TODO: Crear Boton
          BotonAzul(texto:'Ingrese',onPressed: () {
            print(emailCtrl.text);
            print(passCtrl.text);
          },),

        ],
      ),

    );
  }
}


