import 'package:eva_fi_umich/models/levantamientos_model.dart';
import 'package:eva_fi_umich/screens/screens.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class ListaFormatosScreen extends StatelessWidget {
  const ListaFormatosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LevantamientosModel levantamiento =
        ModalRoute.of(context)?.settings.arguments as LevantamientosModel;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Formatos ${levantamiento.nombre}'),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(2, 40, 2, 0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  <Widget>[
                    GestureDetector(
                       onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FormatoGeneralScreen()),
                        );
                      },
                      child: const CardFormatos(nombre: 'Formato General',imagen: Icons.note)
                    ),
                  const CardFormatos(nombre: 'Formato Escuela',imagen: Icons.add_business_rounded),
                  const CardFormatos(nombre: 'Formato Hospital',imagen: Icons.local_hospital_sharp),
              ]),
            ),
            const Divider(height:60,thickness: 2,color:Color.fromARGB(255, 17, 155, 235),),
            const Text('Lista de Formatos Creados',style: TextStyle(color: Color.fromARGB(255, 5, 3, 36),fontSize:20),),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (context, index) =>ListTile(
                      leading: Icon(
                        Icons.note,color: Theme.of(context).primaryColor,size:30,
                      ),
                      title:Text('${index + 1} - Formato General, Código 001'),
                      trailing: const Icon(Icons.edit_note_rounded,size: 30,
                  color:Color.fromARGB(255, 183, 171, 42),),
                      
                  ),
                  separatorBuilder: (_,__)=>const Divider(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
