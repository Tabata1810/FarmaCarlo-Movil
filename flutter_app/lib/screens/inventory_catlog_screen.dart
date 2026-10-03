import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http' as http;
import '../widgets/app_search_bar.dart';
import '../widgets/async_data_state_view.dart';
import '../widgets/entity_card.dart';

class InventoryCatalogScreen extends StatefulWidget {
  const InventoryCatalogScreen({super.key});

  @override
  State<InventoryCatalogScreen> createState() => _InventoryCatalogScreenState();
}

class _InventoryCatalogScreenState extends State<InventoryCatalogScreen> {
  String _searchQuery = '';
  bool _isLoading = false;
  String? _errorMessage;
  List<dynamic> _medicamentos = [];

  // Reemplaza con la IP/Host de tu servidor Flask
  final String _apiUrl = 'http://10.0.2.2:5000/datos'; 

  @override
  void initState() {
    super.initState();
    _cargarInventario();
  }

  Future<void> _cargarInventario() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await http.get(Uri.parse(_apiUrl)).timeout(
        const Duration(seconds: 5),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _medicamentos = data;
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Error del servidor (${response.statusCode})';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'No se pudo conectar con el servidor Flask de FarmaCarlo';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final medicamentosFiltrados = _medicamentos.where((med) =>
      med['nombre'].toString().toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Inventario de Medicamentos')),
      body: Column(
        children: [
          AppSearchBar(
            value: _searchQuery,
            onChanged: (val) => setState(() => _searchQuery = val),
            onClear: () => setState(() => _searchQuery = ''),
          ),
          Expanded(
            child: AsyncDataStateView(
              isLoading: _isLoading,
              errorMessage: _errorMessage,
              isEmpty: medicamentosFiltrados.isEmpty,
              onRetry: _cargarInventario,
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: medicamentosFiltrados.length,
                itemBuilder: (context, index) {
                  final item = medicamentosFiltrados[index];
                  return EntityCard(
                    title: item['nombre'] ?? 'Sin nombre',
                    badgeText: 'ID: ${item['id']}',
                    details: [
                      Text('Precio: \$${item['precio']}'),
                      Text('Stock actual: ${item['stock']} unidades'),
                    ],
                    onEdit: () {},
                    onDelete: () {},
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}