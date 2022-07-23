import 'package:flutter/material.dart';

class BListBuilder extends StatefulWidget {
  List<Map<String, String>> levelObj;
  Function(String selectedTitle)? onPressed;
  double? itemHeight;
  Color? backgroundColor;
  TextStyle? textStyle;
  EdgeInsetsGeometry? listPadding;
  EdgeInsetsGeometry? itemMargin;
  TextAlign? itemAlignment;
  BListBuilder({
    Key? key,
    required this.levelObj,
    this.onPressed,
    this.itemHeight = 100,
    this.backgroundColor,
    this.textStyle,
    this.listPadding,
    this.itemMargin,
    this.itemAlignment,
  }) : super(key: key);

  @override
  _BListBuilderState createState() => _BListBuilderState();
}

class _BListBuilderState extends State<BListBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: widget.listPadding??const EdgeInsets.symmetric(horizontal: 10.0),
      itemCount: widget.levelObj.length,
      itemBuilder: (context, index) => Container(
          height: widget.itemHeight,
          width: double.infinity,
          margin: widget.itemMargin??const EdgeInsets.only(bottom: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.backgroundColor ?? const Color(0xFF2E2E48),
            boxShadow: const [BoxShadow()],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 40,),
              Expanded(
                child: InkWell(
                  child: Text(
                    widget.levelObj[index]['title'] ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: widget.itemAlignment??TextAlign.center,
                    style: widget.textStyle ??
                        TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            shadows: [
                              BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.white.withOpacity(0.54)),
                            ]),
                  ),
                  onTap: () {
                    widget.onPressed!(widget.levelObj[index]['title'] ?? '');
                  },
                ),
              ),
              const SizedBox(width: 40,),
            ],
          )
      ),
    );
  }
}
