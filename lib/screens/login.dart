import 'package:desafio_mobile/screens/videos.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _usuario = '';
  String _senha = '';

  void _submitForm() { 
    // Check if the form is valid 
    if (_formKey.currentState!.validate()) { 
      _formKey.currentState!.save(); // Save the form data 
      // You can perform actions with the form data here and extract the details 
      if( _usuario == 'gabriel'&& _senha == '140120'){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Videos()));
      }else{
        print('errou');
      }
      
    } 
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 300, horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo usuário vazio';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _usuario = value!;  
                    },
                    decoration: InputDecoration(
                      labelText: "Usuário",
                      labelStyle: TextStyle(color: Colors.black),
                    )),
                TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo senha vazio';
                      }
                      return null;
                    },
                    onSaved: (value){
                      _senha = value!;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.black),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                        onPressed: () {_submitForm();},
                        child: const Text("Login")))
              ],
            ),
          ),
        ));
  }
}





// import 'package:flutter/material.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _Loginstate();
// }

// class _Loginstate extends State<Login> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Login Gaasdsadsa  briel')),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Center(
//           child: Column(
//           children: <Widget>[
//           const TextField(

//             decoration: InputDecoration(
//                   labelText:"Usuário",
//                   labelStyle: TextStyle(color: Colors.black),
//                 )
//           ),
//           const TextField(
//             obscureText: true,
//             decoration: InputDecoration(
//                   labelText:"Senha",
//                   labelStyle: TextStyle(color: Colors.black),
//                 )
//           ),
//           Padding(padding: const EdgeInsets.symmetric(vertical: 16),
//           child: ElevatedButton(onPressed: (){
            
//           }, child: const Text("Login"))
//           )
//           ]
//         ),
//         ),
//       ),
//     );
//   }
// }