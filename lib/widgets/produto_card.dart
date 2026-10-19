import 'package:flutter/material.dart';
import '../models/produto.dart';

class ProdutoCard extends StatelessWidget {
  final Produto produto;

  const ProdutoCard({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {

    final bool estoqueCritico = produto.temEstoqueCritico;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Icon(
          Icons.shopping_bag,
          color: estoqueCritico ? Colors.red : Colors.blue,
          size: 36,
        ),
        title: Text(
          produto.nomeProduto,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Preço: R\$ ${produto.preco.toStringAsFixed(2)} | Estoque: ${produto.quantidadeEstoque}',
        ),
        trailing: Icon(
          estoqueCritico ? Icons.warning_amber_rounded : Icons.check_circle,
          color: estoqueCritico ? Colors.red : Colors.green,
        ),
      ),
    );
  }
}