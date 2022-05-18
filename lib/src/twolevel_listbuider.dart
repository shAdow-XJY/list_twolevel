import 'package:flutter/material.dart';

class ListBuilder extends StatefulWidget {
  bool oneLevel;
  List<Map<String, String>> levelObj;
  Function(String selectedTitle)? onPressed;
  double? itemHeight;
  Color? backgroundColor;
  TextStyle? textStyle;
  EdgeInsetsGeometry? listPadding;
  EdgeInsetsGeometry? itemMargin;
  MainAxisAlignment itemAlignment;
  ListBuilder({
    Key? key,
    required this.oneLevel,
    required this.levelObj,
    this.onPressed,
    this.itemHeight = 100,
    this.backgroundColor,
    this.textStyle,
    this.listPadding,
    this.itemMargin,
    this.itemAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  @override
  _ListBuilderState createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
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
          child: widget.oneLevel
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        widget.levelObj[index]['image'] == null
                            ? const SizedBox(
                                height: 80,
                              )
                            : SizedBox(
                                height: 80,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(widget.levelObj[index]
                                            ['image'] ??
                                        'assets/default.png'),
                                  ),
                                ),
                              ),
                        InkWell(
                          child: Text(
                            widget.levelObj[index]['title'] ?? 'default',
                            style: widget.textStyle ??
                                TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w900,
                                    shadows: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color:
                                              Colors.white.withOpacity(0.54)),
                                    ]),
                          ),
                          onTap: () {
                            widget.onPressed!(
                                widget.levelObj[index]['title'] ?? 'default');
                          },
                        )
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.keyboard_arrow_right),
                      iconSize: 48,
                      color: Colors.white,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        widget.onPressed!(
                            widget.levelObj[index]['title'] ?? 'default');
                      },
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: widget.itemAlignment,
                  children: [
                    InkWell(
                      child: Text(
                        widget.levelObj[index]['title'] ?? 'default',
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
                        widget.onPressed!(
                            widget.levelObj[index]['title'] ?? 'default');
                      },
                    ),
                  ],
                )),
    );
  }
}
