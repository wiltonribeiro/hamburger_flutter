import 'package:flutter/material.dart';
import 'package:hamburger_flutter/blocs/ItemBloc.dart';

class TextAnim extends StatefulWidget{
  final double fontSize;
  final String content;
  TextAnim({Key key, this.content, this.fontSize}) : super(key:key);

  _TextAnim createState() => _TextAnim();
}

class _TextAnim extends State<TextAnim> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    animation = Tween<double>(begin: widget.fontSize, end: widget.fontSize + 5).animate(controller);
    animation.addListener(() {
      if (!mounted) return;
      setState(() {});
    });

    new ItemBloc().currentItem.listen((_){
      controller.forward().whenComplete((){
        controller.reverse();
      });
    });
  }

  Widget build(BuildContext context){
    return new Text(widget.content, style:TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: animation.value));
  }

}