import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/news/bloc/news_bloc.dart';
import 'package:app_solidale/screens/news/model/list_news_model.dart';
import 'package:app_solidale/screens/news/page/single_new_page.dart';
import 'package:app_solidale/screens/news/repository/news_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../const/color_constants.dart';



class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
 
   bool isMessageRead = false;


  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(
          context: context, newsRepository: context.read<NewsRepository>())
        ..add(FetchNewsEvent()),
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
        body: BlocConsumer<NewsBloc, NewsState>(
          listener: (context, state) {
            if (state is NewsLoadingState) {
              loadingWidget(context);
            } else if (state is NewsErrorState) {
              Center(
                child: Text(state.error.toString()),
              );
              context.read<NewsBloc>().isFetching = false;
            } else if (state is NewsLoadedState && state.news.isEmpty) {
              const Center(
                child: Text('Nessun messaggio'),
              );
            }
            return;
          },
          builder: (context, state) {
            if (state is NewsLoadingState ) {
              return loadingWidget(context);
            } else if (state is NewsLoadedState) {
              
              context.read<NewsBloc>().isFetching = false;
            } else if (state is NewsErrorState ) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<NewsBloc>()
                        ..isFetching = true
                        ..add(FetchNewsEvent());
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                  const SizedBox(height: 15),
                  Text(state.error, textAlign: TextAlign.center),
                ],
              );
            }
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: ListView(
                shrinkWrap: true,
                controller: context.read<NewsBloc>().scrollController,
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
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                          return GestureDetector(
      onTap: (){
      },
      child: Container(
        padding: EdgeInsets.only(top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(PathConstants.bancoAlim),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Banco Alimentare', style: TextStyle(fontSize: 16),),
                          SizedBox(height: 6,),
                          Text('Consegna prevista',style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text('Oggi',style: TextStyle(fontSize: 12,fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),),
          ],
        ),
      ),
    );
                        
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