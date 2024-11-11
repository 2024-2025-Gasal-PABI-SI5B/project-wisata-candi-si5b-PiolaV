import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget{
  const SignInScreen({super.key});
  // TODO 1 dekrasikan variabel yang dibutuhkan 
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _isSignIn = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
   // TODO 2 pasang appbar 
   appBar: AppBar(
    title: const Text('Sign In'),
   ),
   // TODO 3 PASANG BODY 
   body: Center(
    child: Form(
      child: Column(
        // TODO 4 atur mainAxisAlignment dan crossAxixAligment
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          // TODO 5 buat textformfield untuk namapengguna
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Nama Pengguna',
                hintText: 'Masukan Nama Pengguna',
                border: OutlineInputBorder()
              ),
            ),
          // TODO 6 buat textFormfield untuk kata sandi 
          const SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Kata Sandi',
              hintText: 'Masukan Kata Sandi',
              border: const OutlineInputBorder(),
              errorText: _errorText.isNotEmpty ? _errorText : null,
              suffixIcon: IconButton(onPressed: (){}, 
              icon: Icon(
                
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                
              ),
              ),


              ),
              obscureText: _obscurePassword,
                 
            ),

          




          //  TODO 7 buat elevatedButton untuk sign in 
        ],
      )),
   ),

   );

  }


}