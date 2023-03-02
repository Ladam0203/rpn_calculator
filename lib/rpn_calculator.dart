import 'package:flutter/material.dart';
import 'commands.dart' as cms;

class RPNCalculator extends StatefulWidget {
  @override
  _RPNCalculatorState createState() => _RPNCalculatorState();
}

class _RPNCalculatorState extends State<RPNCalculator> {
  cms.State _state = cms.State.empty();
  String _input = '';

  cms.State transform(cms.State state, cms.Command command) {
    //check if command is operator then parse then check if accept
    if (command is cms.CheckedCommand) {
      if (command.accept(state.registry)) {
        return command.execute(state);
      }
    } else {
      return command.execute(state);
    }
    return state;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
        scaffoldBackgroundColor: Colors.grey[800],
      ),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Display registry
            Container(
              height: 80,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber[200],
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_state.registry.join(' '),
                        style: TextStyle(fontSize: 32)),
                  ],
                ),
              ),
            ),
            //Display input
            Container(
              height: 80,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber[200],
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_input,
                        style: TextStyle(fontSize: 32)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            //1st Row of Number buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber[200],
                  onPressed: () {
                    setState(() {
                      _input = _input + '7';
                    });
                  },
                  child: Text('7', style: TextStyle(fontSize: 32)),
                ),
                FloatingActionButton(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber[200],
                  onPressed: () {
                    setState(() {
                      _input = _input + '8';
                    });
                  },
                  child: Text('8', style: TextStyle(fontSize: 32)),
                ),
                FloatingActionButton(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber[200],
                  onPressed: () {
                    setState(() {
                      _input = _input + '9';
                    });
                  },
                  child: Text('9', style: TextStyle(fontSize: 32)),
                ),
                FloatingActionButton(
                  foregroundColor: Colors.amber[200],
                  backgroundColor: Colors.black,
                  onPressed: () {
                    setState(() {
                      _state = transform(_state, cms.Add());
                    });
                  },
                  child: Text('+', style: TextStyle(fontSize: 32)),
                ),
              ],
            ),
            SizedBox(height: 10),
            //2nd Row of Number buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber[200],
                  onPressed: () {
                    setState(() {
                      _input = _input + '4';
                    });
                  },
                  child: Text('4', style: TextStyle(fontSize: 32)),
                ),
                FloatingActionButton(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber[200],
                  onPressed: () {
                    setState(() {
                      _input = _input + '5';
                    });
                  },
                  child: Text('5', style: TextStyle(fontSize: 32)),
                ),
                FloatingActionButton(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber[200],
                  onPressed: () {
                    setState(() {
                      _input = _input + '6';
                    });
                  },
                  child: Text('6', style: TextStyle(fontSize: 32)),
                ),
                FloatingActionButton(
                  foregroundColor: Colors.amber[200],
                  backgroundColor: Colors.black,
                  onPressed: () {
                    setState(() {
                      _state = transform(_state, cms.Subtract());
                    });
                  },
                  child: Text('-', style: TextStyle(fontSize: 32)),
                ),

              ],
            ),
            SizedBox(height: 10),
            //3rd Row of Number buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber[200],
                  onPressed: () {
                    setState(() {
                      _input = _input + '1';
                    });
                  },
                  child: Text('1', style: TextStyle(fontSize: 32)),
                ),
                FloatingActionButton(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber[200],
                  onPressed: () {
                    setState(() {
                      _input = _input + '2';
                    });
                  },
                  child: Text('2', style: TextStyle(fontSize: 32)),
                ),
                FloatingActionButton(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber[200],
                  onPressed: () {
                    setState(() {
                      _input = _input + '3';
                    });
                  },
                  child: Text('3', style: TextStyle(fontSize: 32)),
                ),
                FloatingActionButton(
                  foregroundColor: Colors.amber[200],
                  backgroundColor: Colors.black,
                  onPressed: () {
                    setState(() {
                      _state = transform(_state, cms.Multiply());
                    });
                  },
                  child: Text('*', style: TextStyle(fontSize: 32)),
                ),
              ],
            ),
            SizedBox(height: 10),
            //4th Row of Number buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber[200],
                  onPressed: () {
                    setState(() {
                      _input = _input + '.';
                    });
                  },
                  child: Text('.', style: TextStyle(fontSize: 32)),
                ),
                FloatingActionButton(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber[200],
                  onPressed: () {
                    setState(() {
                      _input = _input + '0';
                    });
                  },
                  child: Text('0', style: TextStyle(fontSize: 32)),
                ),
                FloatingActionButton(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber[200],
                  onPressed: () {
                    setState(() {
                      _input = _input.substring(0, _input.length - 1);
                    });
                  },
                  child: Icon(Icons.backspace, size: 32),
                ),
                FloatingActionButton(
                  foregroundColor: Colors.amber[200],
                  backgroundColor: Colors.black,
                  onPressed: () {
                    setState(() {
                      _state = transform(_state, cms.Divide());
                    });
                  },
                  child: Text('/', style: TextStyle(fontSize: 32)),
                ),
              ],
            ),
            SizedBox(height: 20),
            //RPN Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Clear button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _state = transform(_state, cms.Clear());
                      _input = '';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[200],
                    foregroundColor: Colors.black,
                  ),
                  child: Text('C', style: TextStyle(fontSize: 32)),
                ),
                //Undo button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _state = transform(_state, cms.Undo());
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[200],
                    foregroundColor: Colors.black,
                  ),
                  child: Icon(Icons.undo, size: 32),
                ),
                //Add button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _state = transform(_state, cms.Enter(_input));
                      _input = '';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[200],
                    foregroundColor: Colors.black,
                  ),
                  child: Icon(Icons.keyboard_return, size: 32),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
