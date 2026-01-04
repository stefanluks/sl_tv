import 'package:flutter/material.dart';
import 'package:sl_tv/data/models/temporada.model.dart';

class DropdownTemporada extends StatelessWidget {
  final List<Temporada> opcoes;
  final Temporada? selecionada;
  final ValueChanged<Temporada> onChanged;

  const DropdownTemporada({
    super.key,
    required this.opcoes,
    required this.selecionada,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Temporada>(
      value: selecionada,
      hint: const Text(
        'Selecione uma temporada',
        style: TextStyle(color: Colors.white),
      ),
      dropdownColor: const Color.fromARGB(255, 109, 109, 109),
      style: const TextStyle(color: Colors.white),
      iconEnabledColor: Colors.white,
      items: opcoes.map((t) {
        return DropdownMenuItem<Temporada>(value: t, child: Text(t.titulo));
      }).toList(),
      onChanged: (t) {
        if (t != null) onChanged(t);
      },
    );
  }
}
