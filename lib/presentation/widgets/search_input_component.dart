import 'dart:async';
import 'package:flutter/material.dart';

class SearchInputComponent extends StatefulWidget {
  const SearchInputComponent({
    super.key,
    required this.onChangedDebounced,
    this.initialValue = '',
  });

  final Function(String) onChangedDebounced;
  final String initialValue;

  @override
  State<SearchInputComponent> createState() => _SearchInputComponentState();
}

class _SearchInputComponentState extends State<SearchInputComponent> {
  late final TextEditingController _controller;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.initialValue);

    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    // Cancela debounce anterior
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Espera 300 ms
    _debounce = Timer(const Duration(milliseconds: 300), () {
      final query = _controller.text.toLowerCase().trim();
      widget.onChangedDebounced(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Buscar carta...',
          hintText: 'Escribe el nombre',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }
}
