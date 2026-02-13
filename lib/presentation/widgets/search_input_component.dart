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
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () {
      final query = _controller.text.toLowerCase().trim();
      widget.onChangedDebounced(query);
    });

    setState(() {});
  }

  void _clear() {
    _controller.clear();
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
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Colors.black.withValues(alpha: 0.25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.35),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.15),
          ),
        ),
        child: TextField(
          controller: _controller,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: "Buscar carta...",
            hintStyle: const TextStyle(color: Colors.white70),
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: Colors.white70,
            ),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.close_rounded),
                    color: Colors.white70,
                    onPressed: _clear,
                  )
                : null,
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          ),
        ),
      ),
    );
  }
}
