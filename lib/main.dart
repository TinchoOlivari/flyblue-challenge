import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flyblue_test/components/appbar.dart';
import 'package:flyblue_test/components/footer.dart';
import 'components/carousel.dart';
import 'components/escalaWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'FlyBlue',
      home: ResultadosVueloCharter(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
    );
  }
}

class ResultadosVueloCharter extends StatefulWidget {
  @override
  _ResultadosVueloCharterState createState() => _ResultadosVueloCharterState();
}

class _ResultadosVueloCharterState extends State<ResultadosVueloCharter> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.loose,
          children: [
            ListView(
              children: [
                CarouselWidget(),
                Container(
                  padding:
                      EdgeInsets.only(top: 18, bottom: 18, right: 24, left: 24),
                  color: Colors.white,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.info,
                            size: 14,
                            color: Color(0xff3A3A3A),
                          ),
                        ),
                        TextSpan(
                          style: TextStyle(color: Colors.black),
                          text:
                              " El valor será confirmado en breve, junto con la disponibilidad. El vuelo puede tener escalas y operar desde aeropuertos distintos a los seleccionados.",
                        ),
                      ],
                    ),
                  ),
                ),
                EsacalaWidget(
                  title: 'BUE - LIM',
                  subtitle: '21 JUN 2020',
                  flight_duration_hs: '3',
                  flight_duration_min: '15',
                  from_airport_code: 'SAEZ',
                  from_airport_hour: '15:30',
                  from_airport_name: 'Ministro Pistarini',
                  from_airport_city: 'Buenos Aires',
                  to_airport_code: 'SPJC',
                  to_airport_hour: '18:45',
                  to_airport_name: 'Jorge Chavez',
                  to_airport_city: 'Lima',
                  cantidad_pasajeros: 6,
                ),
                EsacalaWidget(
                  title: 'LIM - BUE',
                  subtitle: '24 JUN 2020',
                  flight_duration_hs: '3',
                  flight_duration_min: '15',
                  from_airport_code: 'SPJC',
                  from_airport_hour: '10:00',
                  from_airport_name: 'Jorge Chavez',
                  from_airport_city: 'Lima',
                  to_airport_code: 'SAEZ',
                  to_airport_hour: '13:25',
                  to_airport_name: 'Ezeiza',
                  to_airport_city: 'Buenos Aires',
                  cantidad_pasajeros: 6,
                ),
                ShareFlight(),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: queryData.size.height * 0.12 + 24),
                  child: Align(
                    child: SizedBox(
                      width: queryData.size.width * 0.5,
                      child: CupertinoButton(
                        padding: EdgeInsets.all(0),
                        minSize: 40,
                        onPressed: () {},
                        color: Color(0xff00b6cf),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Text('Ver otros aeropuertos'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80, child: AppBarCustom()),
            FooterWidget()
          ],
        ),
      ),
    );
  }
}

class ShareFlight extends StatefulWidget {
  @override
  _ShareFlightState createState() => _ShareFlightState();
}

class _ShareFlightState extends State<ShareFlight> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24, right: 8, left: 8),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'Ahorre dinero en su vuelo',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6F6F6F),
                          ),
                          text:
                              'Ahorre hasta 4.500 USD, al vender a otros pasajeros los asientos que no utilice, nosotros nos encargamos de todo. '),
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('-- Abrir terminos y condiciones -- ');
                                },
                              text: 'Leer los Términos y condiciones.',
                              style: TextStyle(
                                  color: Color(0xff3b82f6),
                                  fontWeight: FontWeight.w500,)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Compartir mi vuelo',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    child: CupertinoSwitch(
                      activeColor: Color(0xff00b6cf),
                      value: _lights,
                      onChanged: (bool value) {
                        setState(() {
                          _lights = value;
                        });
                      },
                    ),
                    onTap: () {
                      setState(() {
                        _lights = !_lights;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
