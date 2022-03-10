import 'package:flutter/material.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';

import '../widgets/app_appbar.dart';

class BaseUi extends StatefulWidget {
  const BaseUi(
      {Key? key,
      required this.title,
      required this.child,
      this.backgroundColor = Pallet.white})
      : super(key: key);
  final String title;
  final Widget child;
  final Color backgroundColor;

  @override
  _BaseUiState createState() => _BaseUiState();
}

class _BaseUiState extends State<BaseUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Column(
        children: [
          AppAppbar(title: widget.title),
          Expanded(child: widget.child)
        ],
      ),
    );
  }
}
