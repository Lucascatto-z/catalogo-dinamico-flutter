class Produto {
  final int idProduto;
  final String nomeProduto;
  final double preco;
  final int quantidadeEstoque;
  final bool disponivel;

  Produto({
    required this.idProduto,
    required this.nomeProduto,
    required this.preco,
    required this.quantidadeEstoque,
    required this.disponivel,
  });

  bool get temEstoqueCritico => quantidadeEstoque < 5;

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      idProduto: json['id_produto'] ?? 0,
      nomeProduto: json['nome_produto'] ?? 'Sem Nome',
      preco: (json['preco'] ?? 0.0).toDouble(),
      quantidadeEstoque: json['quantidade_estoque'] ?? 0,
      disponivel: json['disponivel'] ?? false,
    );
  }
}