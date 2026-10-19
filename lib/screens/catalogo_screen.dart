import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../widgets/produto_card.dart';

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  bool _isLoading = false;
  List<Produto> _produtos = [];

  final String _jsonSimulado = '''
  [
    {"id_produto": 1, "nome_produto": "Turbina de Alta Pressão", "preco": 450.00, "quantidade_estoque": 3, "disponivel": true},
    {"id_produto": 2, "nome_produto": "Válvula de Retenção", "preco": 120.50, "quantidade_estoque": 12, "disponivel": true},
    {"id_produto": 3, "nome_produto": "Sensor de Fluxo Magnético", "preco": 890.00, "quantidade_estoque": 2, "disponivel": true},
    {"id_produto": 4, "nome_produto": "Conexão T em Aço Inox", "preco": 45.00, "quantidade_estoque": 25, "disponivel": true},
    {"id_produto": 5, "nome_produto": "Manômetro Digital 10bar", "preco": 310.00, "quantidade_estoque": 4, "disponivel": true}
  ]
  ''';

  Future<void> _carregarDados() async {
    setState(() {
      _isLoading = true;
    });

    try {

      await Future.delayed(const Duration(seconds: 2));

      final List<dynamic> listaDecodificada = jsonDecode(_jsonSimulado);
      
      final List<Produto> produtosCarregados = listaDecodificada
          .map((item) => Produto.fromJson(item))
          .toList();

      setState(() {
        _produtos = produtosCarregados;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao carregar dados: $e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo Dinâmico - Aula 10'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _isLoading ? null : _carregarDados,
            tooltip: 'Recarregar',
          ),
        ],
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _isLoading ? null : _carregarDados,
        child: const Icon(Icons.sync),
      ),
    );
  }

  Widget _buildBody() {

    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_produtos.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.inbox, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('Nenhum dado encontrado.'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _carregarDados,
              child: const Text('Tentar Novamente'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: _produtos.length,
      itemBuilder: (context, index) {
        return ProdutoCard(produto: _produtos[index]);
      },
    );
  }
}