part of expandable_tabs;

class ExpandableTabItem extends StatefulWidget {
  ExpandableTabItem({
    @required key,
    @required this.iconPath,
    @required this.text,
    @required this.color,
    @required this.textColor,
    @required this.isOpen,
    @required this.animatedHeight,
    @required this.generalHeight,
    @required this.callback,
  })  : assert(iconPath != null),
        assert(key != null),
        assert(color != null),
        assert(textColor != null),
        assert(text != null),
        assert(isOpen != null),
        assert(animatedHeight != null),
        assert(generalHeight != null),
        assert(callback != null),
        super(key: key);

  final String iconPath;
  final String text;
  final Color color;
  final Color textColor;
  final double animatedHeight;
  final double generalHeight;
  final bool isOpen;
  final Function callback;

  @override
  ExpandableTabItemState createState() => ExpandableTabItemState();
}

class ExpandableTabItemState extends State<ExpandableTabItem> {
  bool isOpen;
  var _duration;
  var _curvesAnimation;
  double _animatedHeight;

  @override
  void initState() {
    _duration = const Duration(milliseconds: 100);
    _curvesAnimation = Curves.easeIn;
    _animatedHeight = widget.isOpen ? widget.animatedHeight : 0.0;
    isOpen = widget.isOpen;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _shadowContainer(),
        _mainContainer(),
      ],
    );
  }

  Widget _mainContainer() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          height: widget.generalHeight,
          color: widget.color,
          child: Center(
            child: SizedBox(
              height: 40.0,
              width: 40.0,
              child: Image.asset(
                widget.iconPath,
                color: widget.textColor,
              ),
            ),
          ),
        ),
        AnimatedContainer(
          duration: _duration,
          curve: _curvesAnimation,
          height: _animatedHeight,
          color: widget.color,
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.textColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _shadowContainer() {
    return Column(
      children: <Widget>[
        Container(
          height: widget.generalHeight,
          child: Opacity(
            opacity: 0.0,
            child: Center(
              child: SizedBox(
                height: 40.0,
                width: 40.0,
                child: Image.asset(
                  widget.iconPath,
                  color: widget.textColor,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: widget.color,
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(0.0, 1.0),
              ),
            ],
          ),
        ),
        AnimatedContainer(
          duration: _duration,
          curve: _curvesAnimation,
          height: _animatedHeight,
          decoration: BoxDecoration(
            color: widget.color,
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(0.0, 1.0),
              ),
            ],
          ),
          child: Opacity(
            opacity: 0.0,
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  callbackFunction() => widget.callback();

  showText() {
    setState(() {
      isOpen = true;
      _animatedHeight = widget.animatedHeight;
    });
  }

  hideText() {
    setState(() {
      isOpen = false;
      _animatedHeight = 0.0;
    });
  }
}
