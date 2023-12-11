import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/bloc/send_data_type_service_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart' as globals;

class FormAccompagnamentoOncologico extends StatefulWidget {
  const FormAccompagnamentoOncologico({super.key});


  @override
  State<FormAccompagnamentoOncologico> createState() => _FormAccompagnamentoOncologicoState();
}

class _FormAccompagnamentoOncologicoState extends State<FormAccompagnamentoOncologico> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameAnotherController = TextEditingController();
  final TextEditingController _telepAnotherController = TextEditingController();
int _value = 1;

  
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
final bloc = BlocProvider.of<SendDataTypeServiceBloc>(context);

    return BlocBuilder<SendDataTypeServiceBloc, SendDataTypeServiceState>(builder: (context, state) {
      return  Stack(
      children: [
        SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(
                      20.0,
                    ),
                    child: Column(children: [
                      SizedBox(
                        width: 70,
                        child: Image.asset(
                          PathConstants.accompagnamOncolog,
                        ),
                      ),
                      SizedBox(
                        height: 3 * blockSizeVertical,
                      ),
                      Text(
                        'Accompagnamento Oncologico',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      
                      
                      Form(
                        key: _formKey,
                        child: _formSelectService(),
                      ),
                       
            
                    ])),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CommonStyleButton(
                            title: 'Invia',
                            onTap: () {
                               
                              bloc.add(SendDataTypeServiceEvent(serviceId: '2',  nome: _value == 1 ? globals.userData!.nome : _nameAnotherController.text, telefono: _value == 1 ? globals.userData!.telefono : _telepAnotherController.text));
                            FocusScope.of(context).unfocus();
                            },
                            iconWidget: Text('')),
                      ],
                    ),
                  ),
                ),
      ],
    );
    });
    }
  

   _formSelectService() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Flexible(
                  child: Text(
                'Vorrei accedere al Servizio Accompagnamento Oncologico per:',
              )),
            ],
          ),
        ),
       Row(
        children: [
         
           Radio(
          
          value: 1, groupValue: _value, onChanged: (value){
            setState(() {
              _value = value!;
            });
          }),
          SizedBox(
            width: 10,
          ),
           Text('Me'),
        ],
       ),Row(
        children: [
           Radio(
          
          value: 2, groupValue: _value, onChanged: (value){
            setState(() {
              _value = value!;
            });
          }),
           SizedBox(
            width: 10,
          ),
           Text('Un Mio Familiare'),
        ],
       ),
        /* Row(
              children: [
                
                Checkbox(
                    value: true,
                    tristate: true,
                    onChanged: (value) {
                      setState(() {
                        personale = value!;
                        familiare = false;
                      });
                    }),
                Text('Me'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: false,
                    tristate: false,
                    onChanged: (value) {
                      setState(() {
                        familiare = value!;
                        personale = false;
                      });
                    }),
                Text('Un Mio Familiare'),
              ],
            ), */
       
        SizedBox(
          height: 20,
        ),
        _value == 2
            ? Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                          '(Inserisci i dati del familiare per il quale richiedi il servizio)'),
                    ),
                    TextFormFieldCustom(
                      textEditingController: _nameAnotherController,
                      labelTextCustom: 'Nome e Cognome:',
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo Richiesto*';
                        }
                        return null;
                      },
                    ),
                    TextFormFieldCustom(
                      textEditingController: _telepAnotherController,
                      labelTextCustom: 'Telefono:',
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo Richiesto*';
                        }
                        return null;
                      },
                    ),
                    
                  ],
                ),
              )
            : SizedBox(),
      ],
    );
  }
    
}





