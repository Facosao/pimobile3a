import 'package:alarme_pi/calendario.dart';
import 'package:alarme_pi/card_alarme.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  List<Widget> cards = [];

  _TelaPrincipalState() {
    for (int i = 0; i < 64; i++) {
      cards.add(const AlarmeCard());
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          title: const Text('Alarme PI'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
          backgroundColor: Colors.blueGrey.shade800,
          //shadowColor: Colors.orange,
          bottom: TabBar(
            indicatorColor: Colors.blueGrey.shade50,
            tabs: const <Widget>[
              Tab(text: 'Alarmes'),
              Tab(text: 'Calendário'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: const [
                AlarmeCard(),
                AlarmeCard(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 0.05 * height,
                left: 0.0667 * width,
                right: 0.0667 * width,
                bottom: 0.1 * height,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 0.05 * height),
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
                  const Calendario(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blueGrey.shade400,
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.blueGrey.shade800,
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Nenhum alarme foi ativado.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
