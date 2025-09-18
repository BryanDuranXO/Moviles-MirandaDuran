import 'package:flutter/material.dart';
import 'package:practica3/Worker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController _txtNombreCtrl=TextEditingController();
  TextEditingController _txtApeCtrl=TextEditingController();
  TextEditingController _txtEdadCtrl=TextEditingController();
  List<Worker> workweList = [];
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

    
  }

void addWorker(){
      final nombre = _txtNombreCtrl.text.trim();
      final apellidos = _txtApeCtrl.text.trim();
      final edad = _txtEdadCtrl.text.trim();

      if(nombre.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("El campo nombre no debe estar vacío"))
      );
      return;
      }

       if(apellidos.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("El campo apellidos no debe estar vacío"))
      );
      return;
      }

    if(edad.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("El campo edad no debe estar vacío"))
      );
      return;
      }

    if(int.parse(edad)< 18){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Tienes que ser mayor de edad"))
      );
      return;
      }



  

      setState(() {
        Worker worker = Worker((workweList.length + 1), nombre, apellidos, int.parse(edad));
        workweList.add(worker);
      });

      _txtNombreCtrl.clear();
      _txtApeCtrl.clear();
      _txtEdadCtrl.clear();

    }

      void removeLastTrabajador() {
        if (workweList.isNotEmpty) {
          setState(() {
            workweList.removeLast();
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No hay trabajadores para eliminar")),
          );
        }
      }


    Widget getWorkers(){
      return Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16,),
          Text("Workers"),
          SizedBox(height: 12,),
         ...workweList.map((worker) => 
          Text('ID: ${worker.id} | ${worker.nombre} ${worker.apellidos} | Edad: ${worker.edad}')
        ).toList(),
        ],
      );
    }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            getWorkers(),
            SizedBox(height: 14,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: _txtNombreCtrl,
              decoration: InputDecoration(
                labelText: "Nombre",
                border: OutlineInputBorder()
              ),
            ),
            ),

            Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: _txtApeCtrl,
              decoration: InputDecoration(
                labelText: "Apellidos",
                border: OutlineInputBorder()
              ),
            ),
            ),

            Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: _txtEdadCtrl,
              decoration: InputDecoration(
                labelText: "Edad",
                border: OutlineInputBorder()
              ),
            ),
            ),
            Padding(padding:EdgeInsetsGeometry.all(16),
            child: SizedBox(
             // height: 16,
              child: ElevatedButton(onPressed: addWorker, child:Text("Agregar trabajador")),
            ),
            
            ),

            Padding(padding:EdgeInsetsGeometry.all(2),
            child: SizedBox(
             // height: 16,
              child: ElevatedButton(onPressed: removeLastTrabajador, child:Text("Eliminar trabajador")),
            ),
            
            ),

            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
