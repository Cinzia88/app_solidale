

import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/menu/messages/questionario/bloc/message_bloc.dart';
import 'package:app_solidale/screens/menu/messages/questionario/repository/message_notification_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class SingleMessageNotificationPage extends StatefulWidget {
  String? idSurvey;
   SingleMessageNotificationPage({
    
     this.idSurvey,
  });
  @override
  State<SingleMessageNotificationPage> createState() =>
      _SingleMessageNotificationPageState();
}

class _SingleMessageNotificationPageState
    extends State<SingleMessageNotificationPage> {
  String idMessage = '';
  String title = '';
  String body = '';
  String dataMessaggio = '';

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return BlocProvider<MessageNotificationBloc>(
        create: (context) => MessageNotificationBloc(
            context: context,
            messageRepository: context.read<MessageNoticationRepository>())
          ..add(FetchMessageNoticationEvent()),
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            toolbarHeight: 75.0,
            automaticallyImplyLeading: true,
            flexibleSpace: customAppBar(context: context),
            actions: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ))
            ],
          ),
          drawer: NavigationDrawerWidget(),
          body: BlocConsumer<MessageNotificationBloc, MessageNotificationState>(
              listener: (context, state) {
            if (state is MessageNotificationErrorState) {
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nessun Messaggio'),
                ],
              );
            } else if (state is MessageNotificationLoadedState) {
              idMessage = state.messages.id;
              title = state.messages.title;
              body = state.messages.body;
              dataMessaggio = state.messages.messaggioRicevuto;
            }
            return;
          }, builder: (context, state) {
            return state is MessageNotificationLoadingState 
                ? loadingWidget(context)
                : idMessage == ''
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Nessun Messaggio'),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Messaggio: Questionario',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2 * blockSizeVertical,
                                ),
                              ),
                             
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Compila questo Questionario per noi! Potresti essere scelto per un Progetto Importante!',
                                    ),
                                   
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CommonStyleButton(
                                      title: 'Vai al Questionario',
                                      onTap: () {
                                         _launchInBrowser( Uri.parse(
      '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/questionario-app-solidale/${widget.idSurvey}/${globals.userData!.id}'));
                                      },
                                      iconWidget: Text('')),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
          }),
        ));
  }
}
