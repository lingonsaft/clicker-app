import 'package:flutter/material.dart';

class AchivementNotification extends StatefulWidget {
  final String title;
  final String body;

  AchivementNotification({
    this.title,
    this.body,
    Key key
  }) : super(key: key);

  @override
  _AchivementNotification createState() => _AchivementNotification();
}

class _AchivementNotification extends State<AchivementNotification>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _animation = Tween(begin: -100.0, end: 24.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.2)
    ))
      ..addListener(() {
        if (mounted){
          setState(() {});
        }
      })
      ..addStatusListener((AnimationStatus status){
        if (status == AnimationStatus.completed){
          _controller.reverse().orCancel;
        }
      });
    _controller.forward().orCancel;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _animation.value,
      left: 0,
      child: IgnorePointer(
        child: Material(
          color: Colors.transparent,
          child: Opacity(
            opacity: 1.0,
            child: Container(
              height: 100.0,
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: 100.0,

                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey[400],
                      offset: Offset(0.0, 3.0),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      child: Center(
                        child: Icon(Icons.star, size: 44.0, color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.title,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(widget.body)
                        ],
                      )
                    )
                  ],
                ),
              )
            ),
          )
        )
      )
    );
  }
}
