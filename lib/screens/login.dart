import 'package:flutter/material.dart';
import 'gerenciar_lista.dart';
import 'criar_conta.dart';
import '../widgets/caixa_texto.dart';
import '../widgets/label_entrada.dart';
import '../widgets/botao_custom.dart';

class LoginTela extends StatefulWidget {
  const LoginTela({Key? key}) : super(key: key);

  @override
  State<LoginTela> createState() => _LoginTelaState();
}

class _LoginTelaState extends State<LoginTela> {
  final _key = GlobalKey<_LoginTelaState>();
  // <Widget> Form();
  // <Widget> TextFormField();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Padding(
        padding: EdgeInsets.only(
            top: 0.0875 * height,
            left: 0.12 * width,
            right: 0.12 * width,
            bottom: 0.14 * height),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.alarm,
              size: 150,
              color: Colors.white,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                LabelEntrada(label: 'Usuário'),
                CaixaEntradaTexto(label: ''),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                LabelEntrada(label: "Senha"),
                CaixaEntradaTexto(label: '', isPassword: true),
              ],
            ),
            SizedBox(
              width: 0.36 * width,
              height: 0.0625 * height,
              child: BotaoCustom(
                label: 'Entrar',
                funcionalidade: () => TelaPrincipal.navegar(context),
              ),
            ),
            SizedBox(
              width: 0.36 * width,
              height: 0.0625 * height,
              child: BotaoCustom(
                label: 'Cadastre-se',
                funcionalidade: () => CriarConta.navegar(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
