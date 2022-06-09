import 'package:flutter/material.dart';

class NewPractice extends StatefulWidget {
  const NewPractice({Key? key}) : super(key: key);

  @override
  State<NewPractice> createState() => _NewPracticeState();
}

class _NewPracticeState extends State<NewPractice> {
  final List<String> _listaFecha = <String>[
    '27-01-2022 al 20-06-2022',
    '27-01-2021 al 20-06-2021',
    '27-01-2020 al 20-06-2020',
  ];
  final List<String> _listaDocentes = <String>[
    'Benitez Quecha Claribel',
    'Castañón Olguín Eduardo',
    'García Martínez Raúl',
    'Jiménez Halla Johann Francisco',
    'Monzoy Ventre Elsie Fernanda'
  ];
  final List<String> _listaCarrera = <String>[
    'Ingeniería en Sistemas Computacionales',
    'Ingeniería Eléctrica',
    'Ingeniería en Gestión Empresarial',
    'Ingeniería Electrónica',
    'Ingeniería Industrial'
  ];
  final List<String> _listaMateria = <String>[
    'Ingeniería de software',
    'Lenguajes de interfaz',
    'Programación',
    'Estructura de datos',
    'Mercadotecnia electrónica'
  ];
  final List<String> _listaGrupos = <String>[
    '6SB-SCC-1014',
    'IEU-ELC-1022',
    '3SB-SCD-1007',
    '2GA-AEB-1082',
    '7GA-AEB-1045',
    'SCD-1008-6SA'
  ];
  final List<String> _listaDesde = <String>[
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00'
  ];
  final List<String> _listaHasta = <String>[
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00'
  ];

  String _vistaFecha = 'Seleccione una opción';
  String _vistaDocente = 'Seleccione una opción';
  String _vistaCarrera = 'Seleccione una opción';
  String _vistaMateria = 'Seleccione una opción';
  String _vistaGrupo = 'Seleccione una opción';
  String _vistaDesde = 'Seleccione';
  String _vistaHasta = 'Seleccione';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF01325E),
          //centerTitle: true,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Text(
                  'INSTITUTO TECNOLÓGICO DE OAXACA',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              const Expanded(
                child: Text(
                  '     | LABORATORIO DE BASE DE DATOS',
                  //'INSTITUTO TECNOLÓGICO DE OAXACA',
                  textAlign: TextAlign.start,
                  //textAlign: TextAlign.center,
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
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(left: 60, right: 60, top: 30, bottom: 30),
            child: Column(
              children: <Widget>[
                Row(
                  children: const <Widget>[
                    Expanded(
                      child: Text(
                        'Agregar práctica',
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
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: const Color(0xFFBAD1FF),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 30),
                      child: Column(
                        children: <Widget>[
                          Row(children: const <Widget>[
                            Text(
                              'Agrega los datos solicitados a continuación',
                              style: TextStyle(fontSize: 32),
                            )
                          ]),
                          const SizedBox(
                            height: 100,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: const Color(0xFF01325E),

                                ),
                                child: const Text(
                                  'Fecha',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              DropdownButton(
                                items: _listaFecha.map((String a) {
                                  return DropdownMenuItem(
                                      value: a, child: Text(a));
                                }).toList(),
                                onChanged: (text) => {
                                  setState(() {
                                    _vistaFecha = text.toString();
                                  })
                                },
                                hint: Text(_vistaFecha),
                              ),
                              const SizedBox(
                                width: 160,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: const Color(0xFF01325E),
                                ),
                                child: const Text(
                                  'Docente',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              DropdownButton(
                                items: _listaDocentes.map((String a) {
                                  return DropdownMenuItem(
                                      value: a, child: Text(a));
                                }).toList(),
                                onChanged: (text) => {
                                  setState(() {
                                    _vistaDocente = text.toString();
                                  })
                                },
                                hint: Text(_vistaDocente),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: const Color(0xFF01325E),
                                ),
                                child: const Text(
                                  'Carrera',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              DropdownButton(
                                items: _listaCarrera.map((String a) {
                                  return DropdownMenuItem(
                                      value: a, child: Text(a));
                                }).toList(),
                                onChanged: (text) => {
                                  setState(() {
                                    _vistaCarrera = text.toString();
                                  })
                                },
                                hint: Text(_vistaCarrera),
                              ),
                              const SizedBox(
                                width: 59,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: const Color(0xFF01325E),
                                ),
                                child: const Text(
                                  'Alumnos',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 250,
                                    height: 40,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(15.0),
                                      color: Colors.white,
                                    ),
                                    child: TextFormField(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: const Color(0xFF01325E),
                                ),
                                child: const Text(
                                  'Materia',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              DropdownButton(
                                items: _listaMateria.map((String a) {
                                  return DropdownMenuItem(
                                      value: a, child: Text(a));
                                }).toList(),
                                onChanged: (text) => {
                                  setState(() {
                                    _vistaMateria = text.toString();
                                  })
                                },
                                hint: Text(_vistaMateria),
                              ),
                              const SizedBox(
                                width: 150,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: const Color(0xFF01325E),
                                ),
                                child: const Text(
                                  'Software',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 250,
                                    height: 40,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(15.0),
                                      color: Colors.white,
                                    ),
                                    child: TextFormField(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: const Color(0xFF01325E),
                                ),
                                child: const Text(
                                  'Grupo',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              DropdownButton(
                                items: _listaGrupos.map((String a) {
                                  return DropdownMenuItem(
                                      value: a, child: Text(a));
                                }).toList(),
                                onChanged: (text) => {
                                  setState(() {
                                    _vistaGrupo = text.toString();
                                  })
                                },
                                hint: Text(_vistaGrupo),
                              ),
                              const SizedBox(
                                width: 180,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: const Color(0xFF01325E),
                                ),
                                child: const Text(
                                  'Horario',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Desde',
                                style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              DropdownButton(
                                items: _listaDesde.map((String a) {
                                  return DropdownMenuItem(
                                      value: a, child: Text(a));
                                }).toList(),
                                onChanged: (text) => {
                                  setState(() {
                                    _vistaDesde = text.toString();
                                  })
                                },
                                hint: Text(_vistaDesde),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Hasta',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              DropdownButton(
                                items: _listaHasta.map((String a) {
                                  return DropdownMenuItem(
                                      value: a, child: Text(a));
                                }).toList(),
                                onChanged: (text) => {
                                  setState(() {
                                    _vistaHasta = text.toString();
                                  })
                                },
                                hint: Text(_vistaHasta),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          ElevatedButton(
                              style: _elevatedButtonStyle(context),
                              onPressed: () {},
                              child: const Text('AGREGAR PRÁCTICA')
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
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
}
