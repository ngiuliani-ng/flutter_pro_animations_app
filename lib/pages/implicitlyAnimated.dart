import 'package:flutter/material.dart';

class ImplicitlyAnimatedPage extends StatelessWidget {
  static String routeName = '/home/implicitly-animated';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  Widget appBar() {
    return AppBar(
      elevation: 0,
      title: Text('ImplicitlyAnimated'),
      centerTitle: true,
    );
  }

  Widget body() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: ExpandableCard(
          text:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
          collapsedMaxLines: 2,
        ),
      ),
    );
  }
}

class ExpandableCard extends StatefulWidget {
  ExpandableCard({
    @required this.text,
    @required this.collapsedMaxLines,
  });

  final String text;
  final int collapsedMaxLines;

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool isExpanded = false;

  void expandCard() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: expandCard,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Text(
                  widget.text,
                  maxLines: isExpanded ? null : widget.collapsedMaxLines,
                  overflow: isExpanded ? null : TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Icon(
                  isExpanded ? Icons.compress : Icons.expand,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
