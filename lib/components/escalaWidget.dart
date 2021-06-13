import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';

class EsacalaWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final String from_airport_code;
  final String from_airport_name;
  final String from_airport_hour;
  final String from_airport_city;
  final String to_airport_code;
  final String to_airport_name;
  final String to_airport_hour;
  final String to_airport_city;
  final String flight_duration_hs;
  final String flight_duration_min;

  final int cantidad_pasajeros;

  const EsacalaWidget(
      {Key key,
      this.title,
      this.subtitle,
      this.from_airport_code,
      this.from_airport_name,
      this.from_airport_hour,
      this.from_airport_city,
      this.to_airport_code,
      this.to_airport_name,
      this.to_airport_hour,
      this.to_airport_city,
      this.flight_duration_hs,
      this.flight_duration_min,
      this.cantidad_pasajeros})
      : super(key: key);

  @override
  _EsacalaWidgetState createState() => _EsacalaWidgetState();
}

class _EsacalaWidgetState extends State<EsacalaWidget> {
  int _currentValue = 0;

  @override
  void initState() {
    _currentValue = widget.cantidad_pasajeros;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          padding: EdgeInsets.only(top: 24, bottom: 24, right: 24, left: 24),
          decoration: BoxDecoration(
            color: Color(0xffF9F9F9),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          this.widget.title,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        Text(
                          this.widget.subtitle,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Color(0xff6F6F6F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          this.widget.from_airport_code,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        Text(
                          this.widget.from_airport_hour,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xff6F6F6F),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 22.0, right: 12.0),
                        child: Divider(
                          height: 20,
                          color: Color(0xff646464),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            text: this.widget.flight_duration_hs,
                          ),
                          TextSpan(
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                            text: ' hr ',
                          ),
                          TextSpan(
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            text: this.widget.flight_duration_min,
                          ),
                          TextSpan(
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                            text: ' min ',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 12.0, right: 22.0),
                        child: Divider(
                          height: 20,
                          color: Color(0xff646464),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          this.widget.to_airport_code,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        Text(
                          this.widget.to_airport_hour,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xff6F6F6F),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.from_airport_name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        widget.from_airport_city,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.to_airport_name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        widget.to_airport_city,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Horario de salida: ' + this.widget.from_airport_hour,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Cantidad de pasajeros: ' +
                              this.widget.cantidad_pasajeros.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Center(
                      child: CupertinoButton(
                        child: Text('Modificar'),
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) =>
                                StatefulBuilder(builder: (context, setState) {
                              return CupertinoActionSheet(
                                actions: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              24, 24, 24, 12),
                                          child: Text(('Horario de salida de ' +
                                              this.widget.from_airport_city +
                                              ' a ' +
                                              this.widget.to_airport_city)),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                24, 12, 24, 12),
                                            child: Container(
                                              height: 150,
                                              child: CupertinoDatePicker(
                                                use24hFormat: true,
                                                mode: CupertinoDatePickerMode
                                                    .time,
                                                initialDateTime: DateTime.now(),
                                                onDateTimeChanged: (val) {
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              24, 24, 24, 12),
                                          child: Text('Cantidad de pasajeros'),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12, bottom: 12),
                                            child: NumberPicker.horizontal(
                                              initialValue: _currentValue,
                                              minValue: 1,
                                              selectedTextStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                              maxValue: 10,
                                              listViewHeight: 60,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                              ),
                                              onChanged: (newValue) => setState(
                                                () {
                                                  _currentValue = newValue;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12, bottom: 24),
                                            child: CupertinoButton(
                                              child: Text(
                                                'Confirmar',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
