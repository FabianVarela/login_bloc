import 'package:flutter/material.dart';

enum IconDirection {
  right,
  left,
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.text,
    @required this.onPress,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.icon,
    this.direction = IconDirection.left,
  }) : super(key: key);

  final String text;
  final Function onPress;
  final Color backgroundColor;
  final Color foregroundColor;
  final Widget icon;
  final IconDirection direction;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPress,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (icon != null && direction == IconDirection.left)
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: icon,
              ),
            ),
          Expanded(
            flex: 3,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.2,
                fontWeight: FontWeight.bold,
                color: foregroundColor,
              ),
            ),
          ),
          if (icon != null && direction == IconDirection.right)
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: icon,
              ),
            ),
        ],
      ),
    );
  }
}
