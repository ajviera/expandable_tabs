part of expandable_tabs;

class ExpandableTabs extends StatefulWidget {
  ExpandableTabs({
    @required this.tabs,
    @required this.screenWidth,
    @required this.animatedHeight,
    @required this.generalHeight,
  })  : assert(tabs != null),
        assert(screenWidth != null),
        assert(animatedHeight != null),
        assert(generalHeight != null);

  final List<Map<String, dynamic>> tabs;
  final double screenWidth;
  final double generalHeight;
  final double animatedHeight;

  @override
  _ExpandableTabsState createState() => _ExpandableTabsState();
}

class _ExpandableTabsState extends State<ExpandableTabs> {
  // double _generalWidth;
  List<Widget> _generatedTabs = [];
  List<GlobalKey<ExpandableTabItemState>> keys = [];

  @override
  void initState() {
    // _generalWidth = widget.screenWidth * (1.0 / (widget.tabs.length + 1));
    _createTabs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.screenWidth,
      height: widget.generalHeight + widget.animatedHeight + 1,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _generatedTabs,
      ),
    );
  }

  void _createTabs() {
    widget.tabs.forEach((tab) {
      _generatedTabs.add(
        Expanded(
          child: GestureDetector(
            onTap: () => _open(tab["key"]),
            child: tab["tab"],
          ),
        ),
      );

      keys.add(tab["key"]);
    });
  }

  _open(GlobalKey<ExpandableTabItemState> selectedKey) {
    _close();
    selectedKey.currentState.showText();
    selectedKey.currentState.callbackFunction();
  }

  _close() {
    keys.forEach((key) {
      if (key.currentState.isOpen) key.currentState.hideText();
    });
  }
}
