import 'package:chat/models/usuario.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class UsuariosPage extends StatefulWidget {

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  final usuarios = [
      Usuario(uid:'1', nombre: 'María', email:'test1@test.com', online: true),
      Usuario(uid:'2', nombre: 'Melissa', email:'test2@test.com', online: false),
      Usuario(uid:'3', nombre: 'Karina', email:'test3@test.com', online: true),
      

  ];


  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;

    return Scaffold(
      appBar: AppBar(
      title: Text(usuario.nombre, style:const TextStyle(color: Colors.black87), textAlign: TextAlign.end,),
      elevation: 1,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.exit_to_app,color: Colors.black87),
        onPressed: (){

          //TODO: desconectar el socket server

          Navigator.pushReplacementNamed(context, 'login');
          AuthService.deleteToken();


        },
      ),
      actions:<Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.blue[400]),
            //child: Icon(Icons.offline_bolt, color: Colors.red),
            )
      ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh:()=>_cargarUsuarios(),
        header: WaterDropHeader(
          complete: Icon(Icons.check, color:Colors.blue[400]),
          waterDropColor: Colors.blue,
        ),
        child: _listViewUsuarios(),)
        
   );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_,i)=> _usuarioListTile( usuarios[i] ), 
      separatorBuilder: (_,i)=> const Divider(), 
      itemCount: usuarios.length);
  }




  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
        title: Text(usuario.nombre),
        subtitle: Text(usuario.email),
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(usuario.nombre.substring(0,2)),
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: usuario.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      );
  }
  
  _cargarUsuarios() async {

    
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  }
