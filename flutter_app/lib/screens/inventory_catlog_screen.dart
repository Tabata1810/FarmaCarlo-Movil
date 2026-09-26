import 'package:flutter/material.dart';
import '../widgets/app_search_bar.dart';
import '../widgets/async_data_state_view.dart';

class InventoryCatalogScreen extends StatefulWidget {
  const InventoryCatalogScreen({super.key});

  @override
  State<InventoryCatalogScreen> createState() => _InventoryCatalogScreenState();
}

class _InventoryCatalogScreenState extends State<InventoryCatalogScreen> {
  String _searchQuery = '';
  bool _isLoading = false;
  String? _errorMessage;
  List<Map<String, dynamic>> _medicamentos = [];

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
      // Simula la petición a la API de Flask (/datos)
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _medicamentos = [
          {'id': 'MED-01', 'nombre': 'Paracetamol 500mg', 'precio': '\$2.50', 'stock': 45},
          {'id': 'MED-02', 'nombre': 'Ibuprofeno 400mg', 'precio': '\$3.10', 'stock': 12},
          {'id': 'MED-03', 'nombre': 'Amoxicilina 500mg', 'precio': '\$5.00', 'stock': 30},
        ];
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'No se pudo conectar con el servidor de FarmaCarlo';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final medicamentosFiltrados = _medicamentos.where((med) =>
      med['nombre'].toString().toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario de Medicamentos'),
      ),
      body: Column(
        children: [
          // Componente 1: Barra de Búsqueda
          AppSearchBar(
            value: _searchQuery,
            onChanged: (val) => setState(() => _searchQuery = val),
            onClear: () => setState(() => _searchQuery = ''),
          ),
          // Componente 2: Visor de Estados Asíncronos
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
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    child: ListTile(
                      title: Text(item['nombre']),
                      subtitle: Text('Stock actual: ${item['stock']} unidades'),
                      trailing: Text(
                        item['precio'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
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