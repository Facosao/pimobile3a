import 'package:flutter/material.dart';
import '../widgets/calendario.dart';
import '../widgets/custom_radio.dart';

class EditarAlarme extends StatefulWidget {
  final bool modoCriar;

  const EditarAlarme({Key? key, this.modoCriar = false}) : super(key: key);

  static void navegar(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: ((context) => const EditarAlarme())),
    );
  }

  @override
  State<EditarAlarme> createState() => _EditarAlarmeState();
}

class _EditarAlarmeState extends State<EditarAlarme> {
  bool _modoCriar = false;
  bool customRadio = false;
  List<bool> diasSemana = [false, false, false, false, false, false, false];
  List<String> intervalos = [
    "Nenhum",
    "Dias alternados",
    "A cada 2 dias",
    "A cada 3 dias",
    "A cada 4 dias",
    "A cada 5 dias",
    "A cada 6 dias",
    "A cada 7 dias"
  ];
  List<String> opcoesSoneca = [
    "Desativada",
    "a cada minuto",
    "a cada 3 minutos",
    "a cada 5 minutos",
    "a cada 10 minutos",
  ];

  List<PopupMenuEntry> itensMenuPopUp = [];
  List<PopupMenuEntry> itensMenuRingtones = [];
  List<PopupMenuEntry> itensMenuSoneca = [];
  bool switchRingtone = true;
  bool switchVibracao = true;

  _EditarAlarmeState() {
    for (int i = 0; i < 8; i++) {
      PopupMenuItem novo = PopupMenuItem(value: i, child: Text(intervalos[i]));
      itensMenuPopUp.add(novo);
    }

    for (int i = 0; i < 5; i++) {
      PopupMenuItem novo =
          PopupMenuItem(value: i, child: Text(opcoesSoneca[i]));
      itensMenuSoneca.add(novo);
    }

    PopupMenuItem padrao = const PopupMenuItem(
      value: 0,
      child: Text("Padrão do sistema"),
    );
    PopupMenuItem outros = const PopupMenuItem(
      value: 1,
      child: Text("Aqui teremos outros ringtones"),
    );
    itensMenuRingtones.add(padrao);
    itensMenuRingtones.add(outros);
  }

  void alterarEstadoSemana(int dia) {
    setState(() {
      diasSemana[dia] = !diasSemana[dia];
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> radioSemana = [];

    for (int i = 0; i < 7; i++) {
      Widget novoRadio = RadioCustom(
        dia: i,
        valor: diasSemana[i],
        radioCallback: () => alterarEstadoSemana(i),
      );
      radioSemana.add(novoRadio);
    }

    _modoCriar = widget.modoCriar;

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade800,
        title: _modoCriar
            ? const Text(
                "Criar alarme",
                style: TextStyle(color: Colors.white),
              )
            : const Text(
                "Editar alarme",
                style: TextStyle(color: Colors.white),
              ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
            child: Row(
              children: [
                const Text(
                  'Abril 2023',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_upward),
                ),
                IconButton(
                  onPressed: () {},
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_downward),
                ),
              ],
            ),
          ),
          const Calendario(compacto: true),
          Card(
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Icon(Icons.alarm, color: Colors.white),
                  Container(width: 5),
                  const Text(
                    "Horário",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  const Spacer(),
                  TextButton(
                    child: Text(
                      "06:30",
                      style: TextStyle(
                        color: Colors.blueGrey.shade50,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const TimePickerDialog(
                              initialTime: TimeOfDay(hour: 6, minute: 30));
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
              child: Row(
                children: [
                  const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  Container(width: 5),
                  const Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "Nome do alarme",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.date_range, color: Colors.white),
                      Container(width: 5),
                      const Text(
                        "A cada Seg, Ter, Qua",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Container(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: radioSemana,
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Icon(Icons.replay, color: Colors.white),
                  Container(width: 5),
                  const Text(
                    "Intervalo de repetição",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  const Spacer(),
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) => itensMenuPopUp,
                    child: Text(
                      "Nenhum",
                      style: TextStyle(color: Colors.blueGrey.shade50),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Icon(Icons.bedtime_outlined, color: Colors.white),
                  Container(width: 5),
                  const Text(
                    "Função soneca",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  const Spacer(),
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) => itensMenuSoneca,
                    child: Text(
                      "a cada 5 minutos",
                      style: TextStyle(color: Colors.blueGrey.shade50),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.music_note, color: Colors.white),
                          Container(width: 5),
                          const Text(
                            "Toque musical",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                      Container(height: 10),
                      PopupMenuButton(
                        itemBuilder: (BuildContext context) =>
                            itensMenuRingtones,
                        child: Text(
                          "Padrão do sistema",
                          style: TextStyle(color: Colors.blue.shade50),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Center(
                    child: Switch(
                      value: switchRingtone,
                      thumbColor:
                          const MaterialStatePropertyAll<Color>(Colors.white),
                      activeColor: Colors.blueGrey.shade50,
                      onChanged: (value) {
                        setState(() {
                          switchRingtone = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Icon(Icons.vibration, color: Colors.white),
                  Container(width: 9),
                  const Text(
                    "Vibração",
                    style: TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 20,
                    child: Switch(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      thumbColor:
                          const MaterialStatePropertyAll<Color>(Colors.white),
                      activeColor: Colors.blueGrey.shade50,
                      value: switchVibracao,
                      onChanged: (value) {
                        setState(() {
                          switchVibracao = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}