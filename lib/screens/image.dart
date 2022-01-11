import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Imagen extends StatefulWidget{
  @override 
  _ImagenState createState() => _ImagenState();
}


class _ImagenState extends State<Imagen> {
  Widget _bottomAction(IconData icon){
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
      child: Icon(icon),
      ),
      onTap: () {},
      );
  }
  final ImagePicker _picker =ImagePicker();
  Future selImagen(op) async{

    var photo;
    var image;
    if(op == 1){
      photo = await _picker.pickImage(source: ImageSource.camera);

    }else{
      image = await _picker.pickImage(source: ImageSource.gallery);
    }

  setState((){
    if (photo && image != null){
      photo = File(photo.path);
      image = File(image.path);
    }else{
      print('No has seleccionado ninguna imágen');
    }
  });

    Navigator.of(context).pop();
  }

  opciones(context){
    showDialog(
      context: context,
      builder: (BuildContext context){

        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    selImagen(1);
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    
                    child: Row(
                      children: [
                        Expanded(
                          child:Text ('Seleccionar una foto', style: TextStyle(
                            fontSize: 16
                          ),),
                        ),
                        Icon(Icons.image, color: Colors.blue)
                      ],
                    )
                  ),
                ),

                InkWell(
                  onTap: (){
                    selImagen(2);
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1, color: Colors.grey))
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text ('Tomar una foto', style: TextStyle(
                            fontSize: 16
                          ),),
                        ),
                        Icon(Icons.camera_alt, color: Colors.blue)
                      ],
                    )
                  ),
                ),

                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child:Text ('Cancelar', style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                          ),
                         textAlign: TextAlign.center, 
                        ),
                        ),
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
  @override 
  Widget build (BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text( 'Selecciona una Imagen'),
        ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: (){
                    opciones(context);
                  },
                  child: Text('Selecciona una imagen'),
                ),
                SizedBox(height: 30,),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}