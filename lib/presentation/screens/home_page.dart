import 'package:entrevista/data/services/yugioh_api_service.dart';
import 'package:entrevista/domain/entities/yugioh_card.dart';
import 'package:entrevista/presentation/widgets/card_component.dart';
import 'package:entrevista/presentation/widgets/empty_component.dart';
import 'package:entrevista/presentation/widgets/error_component.dart';
import 'package:entrevista/presentation/widgets/search_input_component.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<YugiohCard>> futureCards;

  String _searchQuery = '';

  @override
  void initState() {
    super.initState();

    futureCards = YugiohApiService().fetchYugiohData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yu-Gi-Oh Cards')),
      body: Column(
        children: [
          SearchInputComponent(
            onChangedDebounced: (query) {
              setState(() {
                _searchQuery = query;
              });
            },
          ),

          Expanded(
            child: FutureBuilder<List<YugiohCard>>(
              future: futureCards,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return ErrorComponent(
                    message: "Error cargando datos\n${snapshot.error}",
                  );
                }

                final allCards = snapshot.data ?? [];

                final filteredCards = allCards.where((card) {
                  return card.name.toLowerCase().contains(_searchQuery);
                }).toList();

                if (filteredCards.isEmpty && _searchQuery.isNotEmpty) {
                  return EmptyComponent(text: "No se encontraron resultados");
                }

                final displayCards = _searchQuery.isEmpty
                    ? allCards.take(10).toList()
                    : filteredCards;

                return ListView.builder(
                  itemCount: displayCards.length,
                  itemBuilder: (context, index) {
                    final card = displayCards[index];

                    return YugiohCardComponent(yugioh: card);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
