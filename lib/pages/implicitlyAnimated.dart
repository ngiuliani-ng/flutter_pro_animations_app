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
    );
  }

  Widget body() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: ExpandableCard(
          text:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
          imageUrl: 'https://bit.ly/33VgDV3',
        ),
      ),
    );
  }
}

class ExpandableCard extends StatefulWidget {
  ExpandableCard({
    @required this.text,
    @required this.imageUrl,
  });

  final String text;
  final String imageUrl;

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
                child: AnimatedCrossFade(
                  duration: Duration(milliseconds: 500),
                  firstCurve: Curves.decelerate,
                  secondCurve: Curves.decelerate,
                  crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  firstChild: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  secondChild: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(widget.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.decelerate,

              /// TODO: Rendere dinamica la [height], in base al [text] passato al widget, quando [isExpanded] è true.
              height: isExpanded ? 164 : 24,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Text(
                  widget.text,
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (child, animation) => ScaleTransition(child: child, scale: animation),
              child: Container(
                /// In questa animazione utilizziamo la [key] per informare flutter che il widget è cambiato.
                key: ValueKey(isExpanded),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: Icon(
                    isExpanded ? Icons.unfold_less : Icons.unfold_more,
                    size: 26,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
