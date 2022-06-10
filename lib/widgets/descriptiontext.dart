import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';
import 'package:gebeta_food_delivery/widgets/customText.dart';

class DescriptionText extends StatefulWidget {
  final String text;
  const DescriptionText({Key? key, required this.text}) : super(key: key);

  @override
  _DescriptionTextState createState() => _DescriptionTextState();
}

class _DescriptionTextState extends State<DescriptionText> {
  late String firstPart;

  late String secondPart;

  bool hiddenText = true;

  double textHeight = 120.0;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstPart = widget.text.substring(0, textHeight.toInt());
      secondPart =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstPart = widget.text;
      secondPart = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondPart.isEmpty
          ? CustomText(text: firstPart, fontSize: 18,)
          : Column(
              children: [
                CustomText(
                  
                    fontSize: 18,
                    text: hiddenText
                        ? (firstPart + '...')
                        : (firstPart + secondPart)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      const CustomText(
                        text: 'more',
                        fontSize: 18,
                        color: AppColors.orange,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.orange,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
