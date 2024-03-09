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

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<ListNewsModel> newsAll = [];

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
                child: Text('Nessun articolo'),
              );
            }
            return;
          },
          builder: (context, state) {
            if (state is NewsLoadingState && newsAll.isEmpty) {
              return loadingWidget(context);
            } else if (state is NewsLoadedState) {
              newsAll.addAll(state.news);
              context.read<NewsBloc>().isFetching = false;
            } else if (state is NewsErrorState && newsAll.isEmpty) {
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
                        'News',
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
                      itemCount: newsAll.length +
                          (context.read<NewsBloc>().isFetching ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < newsAll.length) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contex) => SingleNewPage(
                                            image:
                                                '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/storage/images/${newsAll[index].immagine!}',
                                            title: newsAll[index].titolo,
                                            desc: newsAll[index].testo,
                                          )));
                            },
                            child: Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: CachedNetworkImage(
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.contain,
                                        imageUrl:
                                            '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/storage/images/${newsAll[index].immagine!}',
                                        placeholder: (context, url) =>
                                            const Center(
                                                child: SizedBox(
                                          height: 100,
                                          child: CupertinoActivityIndicator(
                                            color: Color(0xff003b5b),
                                          ),
                                        )),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          PathConstants.logoanfcompletovertic,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            newsAll[index].titolo,
                                            style: TextStyle(
                                              fontSize: 2 * blockSizeVertical,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Text(
                                              newsAll[index].testo,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              softWrap: false,
                                              style: TextStyle(
                                                fontSize: 2 * blockSizeVertical,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
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