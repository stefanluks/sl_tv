import 'package:flutter/material.dart';
import 'package:sl_tv/data/models/temporada.model.dart';

class DropdownTemporada extends StatefulWidget {
  final List<Temporada> opcoes;

  const DropdownTemporada({super.key, required this.opcoes});

  @override
  State<DropdownTemporada> createState() => _DropdownTemporadaState();
}

class _DropdownTemporadaState extends State<DropdownTemporada> {
  String? valorSelecionado;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: valorSelecionado,
      hint: const Text(
        'Selecione uma temporada',
        style: TextStyle(color: Colors.white),
      ),
      dropdownColor: const Color.fromARGB(255, 109, 109, 109),
      style: const TextStyle(color: Colors.white),
      iconEnabledColor: Colors.white,
      items: widget.opcoes.map((Temporada item) {
        return DropdownMenuItem<String>(
          value: item.titulo,
          child: Text(item.titulo),
        );
      }).toList(),
      onChanged: (String? novoValor) {
        setState(() {
          valorSelecionado = novoValor;
        });
      },
    );
  }
}
