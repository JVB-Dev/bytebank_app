import 'package:bytebank_app/components/editor.dart';
import 'package:bytebank_app/models/transferencia.dart';
import 'package:flutter/material.dart';

const _appBarName = "Formulário";

const _labelInputConta = "Conta";
const _hintInputConta = "0000";

const _labelInputValor = "Valor";
const _hintInputValor = "0.00";

const _textButtonEnviar = "Enviar";

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorInputConta = TextEditingController();
  final TextEditingController _controladorInputValor = TextEditingController();

  FormularioTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_appBarName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(_controladorInputConta,
                labelText: _labelInputConta,
                hintText: _hintInputConta,
                inputType: TextInputType.number),
            Editor(_controladorInputValor,
                labelText: _labelInputValor,
                hintText: _hintInputValor,
                inputType: TextInputType.number,
                icon: Icons.monetization_on),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: const Text(_textButtonEnviar),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? conta = int.tryParse(_controladorInputConta.text);
    final double? valor = double.tryParse(_controladorInputValor.text);

    if (conta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, conta);

      Navigator.pop(context, transferenciaCriada);
    }
  }
}
