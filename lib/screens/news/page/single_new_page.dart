import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:anf_app/const/color_constants.dart';

import '../../common_widgets/background_style/custom_appbar.dart';

// ignore: must_be_immutable
class SingleNewPage extends StatefulWidget {
  String image;
  SingleNewPage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<SingleNewPage> createState() => _SingleNewPageState();
}

class _SingleNewPageState extends State<SingleNewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: customAppBar(context: context, onPressed: () => Navigator.pop(context), arrow: true )),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    imageUrl: widget.image,
                    placeholder: (context, url) => const Center(
                        child: SizedBox(
                      height: 100,
                      child: CupertinoActivityIndicator(
                        color: ColorConstants.orangeGradients3,
                      ),
                    )),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: Text(
                        'Lorem ipsum',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: ColorConstants.orangeGradients3,
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
