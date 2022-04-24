class Transferencia {
  final double valor;
  final int conta;

  const Transferencia(this.valor, this.conta);

  @override
  String toString() {
    return "Conta: $conta; Valor: $valor";
  }
}