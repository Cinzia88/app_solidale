import 'package:anf_app/screens/styles/layers/config.dart';
import 'package:flutter/material.dart';

class LayerOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: layerOneBg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60.0),
                    topRight: Radius.circular(60.0),

        ),
      ),
    );
  }
}