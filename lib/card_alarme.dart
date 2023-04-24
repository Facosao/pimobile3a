import 'package:flutter/material.dart';

class AlarmeCard extends StatefulWidget {
  const AlarmeCard({Key? key}) : super(key: key);

  @override
  State<AlarmeCard> createState() => _AlarmeCardState();
}

class _AlarmeCardState extends State<AlarmeCard> {
  bool alarmeAtivado = false;

  Text textoCard(String texto) {
    return Text(
      texto,
      style: const TextStyle(fontSize: 14, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    //double card_tamanho = 0.833 * width;

    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.blueGrey,
      child: InkWell(
        onTap: () {},
        onLongPress: () {},
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textoCard('Nome do primeiro alarme'),
              //textoCard('Nome do segundo alarme'),
              /*
                Padding(
                  padding: EdgeInsets.only(
                  top: 0.01 * height,
                  bottom: 0.02 * height,
                  left: 0.05 * width,
                  right: 0.05 * width
                  ),
                  padding: const EdgeInsets.only(top: 3),
                  child: SizedBox(
                    width: 0.893 * card_tamanho,
                    height: 1,
                    child: Container(
                      color: Colors.orange,
                    ),
                  ),
                ),
                */
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 1,
                      color: Colors.orange,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '12:34',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Switch(
                    value: alarmeAtivado,
                    thumbColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    activeColor: Colors.blueGrey.shade50,
                    //const Color.fromARGB(255, 69, 75, 77)
                    onChanged: (value) {
                      setState(
                        () {
                          alarmeAtivado = value;
                        },
                      );
                    },
                  ),
                ],
              ),
              textoCard('Frequência de repetição do alarme'),
            ],
          ),
        ),
      ),
    );
  }
}
