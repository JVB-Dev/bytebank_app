import 'package:bytebank_app/models/transferencia.dart';
import 'package:bytebank_app/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const _appBarName = "Transferências";

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  ListaTransferencias({Key? key}) : super(key: key);

  @override
  _ListaTransferenciasState createState() => _ListaTransferenciasState();
}

class _ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_appBarName),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(8.0),
        child: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, index) =>
              ItemTransferencia(widget._transferencias[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final Transferencia? transferenciaRecebida = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FormularioTransferencia()));

            if (transferenciaRecebida != null) {
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
                    SnackBar(content: Text('$transferenciaRecebida')));

              setState(() {
                widget._transferencias.add(transferenciaRecebida);
              });
            }
          },
          child: const Icon(Icons.add)),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.conta.toString()),
      ),
    );
  }
}
