import 'package:flutter/material.dart';
import 'bottons.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String input = '';
  String output = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '.',
    '0',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Column(
        children: [
          Expanded(
              child: Material(
                elevation: 20,
                shadowColor: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFFF5F7FA).withOpacity(1),
                        Color(0xFFFCB69F).withOpacity(1),

                      ])
                  ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),


                    alignment: Alignment.centerLeft,
                    child: Text(
                      input,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,

                    child: Text(
                      output,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
            ),
          ),
              )),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return CalButton(
                        bottonText: buttons[index],
                        color: Colors.orange[400],
                        textcolor: Colors.white,

                        buttonPresseed: (){
                          setState(() {
                            input='';
                            output='';
                          });
                        },
                      );
                    }

                    else if (index == 1) {
                      return CalButton(
                        bottonText: buttons[index],
                        color: Colors.red[400],
                        textcolor: Colors.white,
                       buttonPresseed: ()
                        {setState(() {
                          input=input.substring(0,input.length-1) ;
                        });
                        },
                      );
                    }
//equal
                    else if (index == buttons.length-1) {
                      return CalButton(
                        bottonText: buttons[index],
                        color: Colors.green[400],
                        textcolor: Colors.white,
                        buttonPresseed: ()
                        {setState(() {
                          equalPressed();
                       });
                        },
                      );
                    }

                    else {
                      return CalButton(
                        bottonText: buttons[index],
                        color: operators(buttons[index])
                            ? Colors.green[400]
                            : Colors.green[100],
                        textcolor: operators(buttons[index])
                            ? Colors.white
                            : Colors.black,
                        buttonPresseed: (){
                          setState(() {
                            input +=buttons[index];
                          });
                        },
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  bool operators(String x) {
    if (x == "%" || x == "*" || x == "+" || x == "-" || x == "/" || x == "=") {
      return true;
    }
    return false;
  }

void equalPressed()
{String finalinput=input;


  Parser p = Parser();
  Expression exp = p.parse(finalinput);
  ContextModel cm=ContextModel();
  double evaluate=exp.evaluate(EvaluationType.REAL, cm);

  output=evaluate.toString();

}
}
