import 'package:flutter/material.dart';
import '../widgets/category_row.dart';
import '../../data/services/api.service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<dynamic>> categorias;

  @override
  void initState() {
    super.initState();
    categorias = ApiService.get('app-api-animes-filmes-conteudo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 35, 35, 35),
        title: const Text(
          'SL TV',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: categorias,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro ao carregar conteúdo!',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          final data = snapshot.data!;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final categoria = data[index];

              return CategoryRow(
                title: categoria['categoria'] ?? 'Sem Categoria',
                videos: categoria['videos'] ?? [],
              );
            },
          );
        },
      ),
    );
  }
}
