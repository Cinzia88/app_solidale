import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/menu/messages/bloc/message_bloc.dart';
import 'package:app_solidale/screens/menu/messages/model/list_messages_model.dart';
import 'package:app_solidale/screens/menu/messages/repository/message_repository.dart';
import 'package:app_solidale/screens/menu/messages/single_message_page.dart';
import 'package:app_solidale/screens/news/bloc/news_bloc.dart';
import 'package:app_solidale/screens/news/model/list_news_model.dart';
import 'package:app_solidale/screens/news/page/single_new_page.dart';
import 'package:app_solidale/screens/news/repository/news_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

import '../../../const/color_constants.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  bool isMessageRead = false;
  List<ListMessageModel> messagesAll = [];

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return BlocProvider<MessageBloc>(
      create: (context) => MessageBloc(
          context: context,
          messageRepository: context.read<MessageRepository>())
        ..add(FetchMessageEvent()),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          toolbarHeight: 75.0,
          automaticallyImplyLeading: true,
          flexibleSpace: customAppBar(context: context),
        ),
        drawer: NavigationDrawerWidget(),
        body: BlocConsumer<MessageBloc, MessageState>(
          listener: (context, state) {
            if (state is MessageLoadingState) {
              loadingWidget(context);
            } else if (state is MessageErrorState) {
              Center(
                child: Text(state.error.toString()),
              );
              context.read<MessageBloc>().isFetching = false;
            } else if (state is MessageLoadedState && state.messages.isEmpty) {
              const Center(
                child: Text('Nessun messaggio'),
              );
            }
            return;
          },
          builder: (context, state) {
            if (state is MessageLoadingState) {
              return loadingWidget(context);
            } else if (state is MessageLoadedState) {
              messagesAll.addAll(state.messages);
              context.read<MessageBloc>().isFetching = false;
            }else if (state is MessageErrorState && messagesAll.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<MessageBloc>()
                        ..isFetching = true
                        ..add(FetchMessageEvent());
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                  const SizedBox(height: 15),
                  Text(state.error, textAlign: TextAlign.center),
                ],
              );
            }
            return  Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: ListView(
                shrinkWrap: true,
                controller: context.read<MessageBloc>().scrollController,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Messaggi',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  const Divider(
                    color: ColorConstants.orangeGradients3,
                  ),
                  messagesAll.isEmpty ? Center(child: Text('Nessun Messaggio')) : 
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: messagesAll.length +
                          (context.read<MessageBloc>().isFetching ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < messagesAll.length) {
                          return GestureDetector(
                            onTap: () {
                              
                               Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contex) => SingleMessagePage(
                                            
                                            date: messagesAll[index].dataConsegna,
                                            idMessage: messagesAll[index].id,
                                          )));
                            
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        messagesAll[index].serviceId == '4'
                                            ? CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    PathConstants.bancoAlim),
                                                maxRadius: 18,
                                              )
                                            : messagesAll[index].serviceId ==
                                                    '3'
                                                ? CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        PathConstants
                                                            .accompagnamOncolog),
                                                    maxRadius: 18,
                                                  )
                                                : messagesAll[index]
                                                            .serviceId ==
                                                        '2'
                                                    ? CircleAvatar(
                                                        backgroundImage:
                                                            AssetImage(
                                                                PathConstants
                                                                    .taxiSolidale),
                                                        maxRadius: 18,
                                                      )
                                                    : SizedBox(),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                          child: Container(
                                            color: Colors.transparent,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  messagesAll[index]
                                                              .serviceId ==
                                                          '4'
                                                      ? 'Banco Alimentare'
                                                      : messagesAll[index]
                                                                  .serviceId ==
                                                              '3'
                                                          ? 'Accompagnamento Oncologico'
                                                          : messagesAll[index]
                                                                      .serviceId ==
                                                                  '2'
                                                              ? 'Taxi Solidale'
                                                              : '',
                                                  style: isMessageRead == false ? 
                                                   TextStyle(fontSize: 16, fontWeight: FontWeight.bold) : 
                                                      TextStyle(fontSize: 16),
                                                ),
                                                
                                                Text(
                                                  'Ciao, in seguito alla tua richiesta del servizio "Banco Alimentare", ti informiamo che la consegna del pacco è prevista per il giorno:',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color:
                                                          Colors.grey.shade600,
                                                      fontWeight: isMessageRead == false
                                                          ? FontWeight.bold
                                                          : FontWeight.normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    DateFormat.MMMd('it_IT')
                                        .format(DateTime.parse(
                                      messagesAll[index].dataConsegna,
                                    )),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: isMessageRead == false
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return loadingWidget(context);
                        }
                      })
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}




/* CachedNetworkImage(
                  imageUrl: images[0],
                  placeholder: (context, url) => const Center(
                      child: SizedBox(
                    height: 100,
                    child: CupertinoActivityIndicator(
                      color: Color(0xff003b5b),
                    ),
                  )),
                  errorWidget: (context, url, error) => SizedBox(
                    height: 60,
                    child: Image.asset(
                      'lib/resources/images/logo.png',
                    ),
                  ),
                ), */