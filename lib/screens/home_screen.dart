import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/helpers.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _signoController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String mensagemRetorno = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Atividade Widgets"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.all(36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                TextFormField(
                  controller: _signoController,
                  keyboardType: TextInputType .text,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  validator: (signo){
                    if(signo.isEmpty)
                      return "Informe seu signo";
                    return null;
                  },
                  onFieldSubmitted: (signo){
                    if(formKey.currentState.validate()){
                     setState(() {
                       mensagemRetorno = verificarSigno(signo: refatorarSigno(_signoController.text));
                     });
                    }else{
                      setState(() {
                        mensagemRetorno="";
                      });
                    }
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    counterText: '',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 0.5,
                      ),
                    ),
                    labelText: "Digite o seu signo",
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: (){
                      if(formKey.currentState.validate()){
                          setState(() {
                            mensagemRetorno = verificarSigno(signo: refatorarSigno(_signoController.text));
                          });
                      }else{
                        setState(() {
                          mensagemRetorno="";
                        });
                      }
                    },
                    padding: EdgeInsets.all(8),
                    elevation: 3,
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Container(
                      height: 36,
                      child: Center(
                        child: Text(
                          "Verificar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                if(mensagemRetorno.isNotEmpty)
                Text(
                  mensagemRetorno,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );

  }

  String verificarSigno({@override String signo}){

    String mensagem;

    if(signo=="AQUARIO"){
      mensagem = "20 de Janeiro – 18 de Fevereiro";
    }else if(signo=="PEIXES"){
      mensagem = "19 de Fevereiro – 20 de Março";
    }else if(signo=="ARIES"){
      mensagem = "21 de Março – 19 de Abril";
    }else if(signo=="TOURO"){
      mensagem = "20 de Abril – 20 de Maio";
    }else if(signo=="GEMEOS"){
      mensagem = "21 de Maio – 20 de Junho";
    }else if(signo=="CANCER"){
      mensagem = "21 de Junho – 22 de Julho";
    }else if(signo=="LEAO"){
      mensagem = "23 de Julho – 22 de Agosto";
    }else if(signo=="VIRGEM"){
      mensagem = "23 de Agosto – 22 de Setembro";
    }else if(signo=="LIBRA"){
      mensagem = "23 de Setembro – 22 de Outubro";
    }else if(signo=="ESCORPIAO"){
      mensagem = "October 23 - November 2";
    }else if(signo=="SAGITARIO"){
      mensagem = "22 de Novembro – 21 de Dezembro";
    }else if(signo=="CAPRICONIO"){
      mensagem = "22 de Dezembro – 19 de Janeiro";
    }else{
      mensagem = "Signo inválido!";
    }

    return mensagem;

  }
}
