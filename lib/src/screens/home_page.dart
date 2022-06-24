/*
* Autor: Orlando Lucero Camacho
* Descripción: Este fichero es la ventana principal de nuestro proyecto,
*              aquí mostramos el menú de opciones para los diferentes
*              paneles y principalmente mostramos la tabla con las
*              prácticas ya creadas.
* Última modificación: 23-06-2022
* */
import 'package:flutter/material.dart';

import '../models/db.dart';
import '../models/practica.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _listaSemestres = <String>[
    '27-01-2022 al 20-06-2022',
    '27-01-2021 al 20-06-2021',
    '27-01-2020 al 20-06-2020',
  ];
  final List<String> _listaCarreras = <String>[
    'Todas las carreras',
    'Ingeniería en Sistemas Computacionales',
    'Ingeniería Eléctrica',
    'Ingeniería en Gestión Empresarial',
    'Ingeniería Electrónica',
    'Ingeniería Industrial'
  ];
  String _vista = 'Seleccione una opción';
  String _vista2 = 'Seleccione una opción';
  final double? columnSpacing = 50.0;
  List<Practica> practicas = [];

  /*@override
  void initState() {
    cargaPracticas();
    super.initState();
  }

  cargaPracticas() async {
    List<Practica> auxPractica = await DB.practicas();

    setState(() {
      practicas = auxPractica;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF01325E),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Text(
                  'INSTITUTO TECNOLÓGICO DE OAXACA       |       LABORATORIO DE BASE DE DATOS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ),
              ClipRRect(
                //borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/ito_escudo.png',
                  height: 56,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 30),
            child: Column(
              children: <Widget>[
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Prácticas programadas',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: const Color(0xFFBAD1FF),
                        ),
                        child: const Text('Semestre:',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      DropdownButton(
                        items: _listaSemestres.map((String a) {
                          return DropdownMenuItem(value: a, child: Text(a));
                        }).toList(),
                        onChanged: (text) => {
                          setState(() {
                            _vista = text.toString();
                          })
                        },
                        hint: Text(_vista),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: const Color(0xFFBAD1FF),
                        ),
                        child: const Text(
                          'Carrera:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      DropdownButton(
                        items: _listaCarreras.map((String b) {
                          return DropdownMenuItem(value: b, child: Text(b));
                        }).toList(),
                        onChanged: (value) => {
                          setState(() {
                            _vista2 = value.toString();
                          })
                        },
                        hint: Text(_vista2),
                      ),
                      //const SizedBox(width: 580,),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          style: _elevatedButtonStyle(context),
                          onPressed: () => _controlPanel(context),
                          child: const Text('Panel de control')),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          style: _elevatedButtonStyle(context),
                          onPressed: () => _addPractice(context),
                          child: const Text('Nueva práctica'))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: const Color(0xFFBAD1FF),
                    child: DataTable(
                        columnSpacing: 20,
                        columns: [
                      DataColumn(
                        label: Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xFF01325E),
                              ),
                              child: const Text(
                                'FECHA',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xFF01325E),
                              ),
                              child: const Text(
                                'DÍA',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xFF01325E),
                              ),
                              child: const Text(
                                'HORARIO',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xFF01325E),
                              ),
                              child: const Text(
                                'GRUPO',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xFF01325E),
                              ),
                              child: const Text(
                                'CARRERA',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xFF01325E),
                              ),
                              child: const Text(
                                'MATERIA',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xFF01325E),
                              ),
                              child: const Text(
                                'DOCENTE',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xFF01325E),
                              ),
                              child: const Text(
                                'ALUMNOS',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color(0xFF01325E),
                          ),
                          child: const Text(
                            'SOFTWARE',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ], rows: [
                      const DataRow(cells: [
                        DataCell(Center(child: Text('23/05/2022'))),
                        DataCell(Center(child: Text('Lunes'))),
                        DataCell(Center(child: Text('07:00 - 08:00'))),
                        DataCell(Center(child: Text('SCD-2008-6SA'))),
                        DataCell(Text('Ingeniería en Sistemas Computacionales')),
                        DataCell(Text('Ingeniería de Software')),
                        DataCell(Text('Eduardo Castañón Olguín')),
                        DataCell(Center(child: Text('30'))),
                        DataCell(Center(child: Text('Oracle')))
                      ]),
                      _dataRow(),
                      _dataRow(),
                      _dataRow(),
                      _dataRow(),
                      _dataRow(),
                      _dataRow(),
                      _dataRow(),
                      _dataRow(),
                      _dataRow(),
                      _dataRow(),
                      _dataRow(),
                      _dataRow()
                    ]),
                  ),
                ),
                //Text('${practicas[0].software}')
              ],
            ),
          ),
        ),
      ),
    );
  }

  DataRow _dataRow() {
    return DataRow(cells: [
      DataCell(Center(child: Text('23/05/2022'))),
      DataCell(Center(child: Text('Lunes'))),
      DataCell(Center(child: Text('07:00 - 08:00'))),
      DataCell(Center(child: Text('SCD-2008-6SA'))),
      DataCell(Text('Ingeniería en Sistemas Computacionales')),
      DataCell(Text('Ingeniería de Software')),
      DataCell(Text('Eduardo Castañón Olguín')),
      DataCell(Center(child: Text('30'))),
      DataCell(Center(child: Text('Oracle')))
    ]);
  }

  ButtonStyle _elevatedButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      primary: Theme.of(context).primaryColor,
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  void _addPractice(BuildContext context) {
    Navigator.of(context).pushNamed('/nuevaPracticaPage');
  }

  void _controlPanel(BuildContext context) {
    Navigator.of(context).pushNamed('/controlPanelPage');
  }
}
