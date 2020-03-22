import 'package:flutter/material.dart';
import 'package:flutter/services.dart';//serve para mudar a cor da statusbar
import 'package:provider/provider.dart';
import '../models/appdata.dart';

class PreloadPage extends StatefulWidget {
  @override
  _PreloadPageState createState() => _PreloadPageState();
}

class _PreloadPageState extends State<PreloadPage> {
  bool _loading = true;

  void _requestInfo() async{
    await Future.delayed(Duration(seconds: 1));//tem que atrasar ele pra poder pegar as informações da API

    setState(() {
      _loading = true;
    });

    bool req = await Provider.of<AppData>(context).requestData();

    if(req) {
      Navigator.pushReplacementNamed(context, '/home'); //vai p/ home e não vai deixar voltar pro preload
    } else {
      setState(() {
        _loading = false;
      });
    }

    
  }

  @override
  void initState() {
    super.initState();
    this._requestInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      (Theme.of(context).platform == TargetPlatform.iOS)
       ? SystemUiOverlayStyle.dark
       : SystemUiOverlayStyle.light
    );
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image.asset(
              'lib/assets/devstravel_logo.png',
              width: 200,
            ),

            (_loading) ? loadingInfo() : tryAgain()

          ],
        ),
      ),
    );
  }

  Widget loadingInfo() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Text(
            'Carregando Informações...',
            style: TextStyle(fontSize: 16),
          ),
        ),
        CircularProgressIndicator(
          strokeWidth: 1.5,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ),
      ],
    );
  }

  Widget tryAgain() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: RaisedButton(
        child: Text(
          'Tentar Novamente',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
        color: Colors.blue,
        elevation: 10,
      ),
    );
  }
}
