import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:dio/dio.dart';

class Camara extends StatefulWidget{
  @override 
  _CamaraState createState() => _CamaraState();
}


class _CamaraState extends State<Camara> {

  File? imagen = null;
  final picker = ImagePicker();
  Future selImagen(op) async{

    var pickedFile;
    if(op == 1){
      pickedFile = await picker.pickImage(source: ImageSource.camera);

    }else{
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

  setState((){
    if (pickedFile != null){
      // imagen = File(pickedFile.path);
      cortar(File(pickedFile.path));
    }else{
      print('No has seleccionado ninguna imagen');
    }
  });

    Navigator.of(context).pop();
  }

  cortar(picked) async{
    File? cortado = await ImageCropper.cropImage(sourcePath: picked.path,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0)
    );
    if(cortado != null){
      setState(() {
        imagen = cortado;
      });
    }
  }
  Dio dio = new Dio();
  Future<void> subir_imagen()async{
    
    try{
      String filename = imagen!.path.split('/').last;
      FormData formData = new FormData.fromMap({
        // 'usuario' : 'id',
        // 'nombre' : 'nombre',
        'file' : await MultipartFile.fromFile(
          imagen!.path, filename: filename
        )
      });

      await dio.post('http://192.168.1.132',
      data: formData).then((value){
        if(value.toString()=='1'){
          print('La imagen se subió correctamente');
        }else{
          print('Hubo un error');
        }
      }
      );
    }catch(e){
      print(e.toString());
    }
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
          title: Text( 'Fotografías'),
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
                  child: Text('Selecciona una imagen', style: TextStyle(
                    color: Colors.white
                  ),),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: (){
                   subir_imagen();
                  },
                  child: Text('Subir Imagen', style: TextStyle(
                    color: Colors.white
                  ),),
                ),
                SizedBox(height: 10,),
                SizedBox(height: 30,),
                imagen != null ? Image.file(imagen!) : Center()
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}