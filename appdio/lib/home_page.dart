import 'package:appdio/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

  final ApiService _api = ApiService();
  List<dynamic> users = [];
  bool loading = true;

  @override
  void initState() {
    
    super.initState();
    // cargar datos
    loadingData();
  }

  Future<void> loadingData() async{
    final resutl = await _api.getUsers();
    setState(() {
      users = resutl;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo DIO con Bryan"),),
      body: loading ? Center(child: CircularProgressIndicator(),)
      : ListView.builder(
        itemCount: users.length ,
        itemBuilder: (context, index){
          final item = users[index];
          return ListTile(
            title: Text(item['name']),
            subtitle: Text(item['email']),
          );
        },
      )
    );
  }

}