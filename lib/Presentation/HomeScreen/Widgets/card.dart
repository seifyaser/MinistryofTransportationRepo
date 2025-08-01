import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeCard extends StatefulWidget {
  final String text;
  final String imagePath;
  final List<Widget> subCards; 

  const HomeCard({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.subCards, 
  }) : super(key: key);

  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    _isExpanded ? Icons.keyboard_arrow_down : Icons.arrow_back_ios,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: Text(
                      widget.text,
                      style: const TextStyle(fontSize: 13, color: Color(0xFF38628B)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 15),
                  SvgPicture.asset(
                    widget.imagePath,
                    height: 38,
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Column(
                children: [
                //  const Divider(height: 1, color: Colors.grey),
                  ..._buildSubCardList(),
                ],
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildSubCardList() {
    final widgets = <Widget>[];
    for (var i = 0; i < widget.subCards.length; i++) {
      widgets.add(widget.subCards[i]);
      if (i != widget.subCards.length - 3) {
        widgets.add(const SizedBox(height: 12));
      }
    }
    return widgets;
  }
}
