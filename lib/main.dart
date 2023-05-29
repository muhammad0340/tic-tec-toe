import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var grid = [
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
  ];
  var winner = '';
  var currentPlayer = 'X';
void drawxo(i){

  if(grid[i]== '-'){
    setState(() {
      grid[i] = currentPlayer;
      currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
    });
  }
  findWinner(grid[i]);

}
void reset(){
  setState(() {
    winner = '';
    grid = [
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
    ];
  });
}

bool cheakMove(i1,i2,i3,sign){
  if(grid[i1] == sign && grid[i2] == sign && grid[i3 ] == sign){
    return true;
  }
  else{
    return false;
  }
}

void findWinner(currentSign){
  if(
  cheakMove(0,1,2,currentSign) || cheakMove(3,4,5,currentSign) || cheakMove(6,7,8,currentSign) ||
  cheakMove(0,3,6,currentSign) || cheakMove(1,4,7,currentSign)  || cheakMove(2,5,8,currentSign) ||
  cheakMove(0,4,8,currentSign) || cheakMove(2,4,6,currentSign)
  ){
    setState(() {
      winner = currentSign;
    });
    //print("$currentSign won");
  }
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tic Tec Toe"),
        ),
        body: Column(
          children: [
            if(winner != '') Text("$winner won the game",style: TextStyle(fontSize: 40),),
            Container(
              color: Colors.black,
              margin: EdgeInsets.all(20),
              child: GridView.builder(
                shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: grid.length,
                  itemBuilder: (context, index) {
                    return Material(
                      color: Colors.orange,
                      child: InkWell(
                        onTap: () => drawxo(index),
                        splashColor: Colors.black,
                        child: Center(
                          child: Text(grid[index],style: TextStyle(fontSize: 50,),),
                        ),
                      ),
                    );
                  }),
            ),
            ElevatedButton.icon(onPressed: reset, icon: Icon(Icons.refresh), label: Text("play again"),),
          ],
        ),
      ),
    );
  }
}
