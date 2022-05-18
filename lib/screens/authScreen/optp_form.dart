import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
          child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 68,
              width: 60,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "0",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.orange),
                  ),
                ),
                onChanged: ((value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                }),
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            SizedBox(
              height: 68,
              width: 50,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "0",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.orange))),
                onChanged: ((value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                }),
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            SizedBox(
              height: 68,
              width: 60,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "0",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.orange))),
                onChanged: ((value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                }),
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            SizedBox(
              height: 68,
              width: 60,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "0",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.orange))),
                //onChanged: ((value) {
                // if (value.length == 1) {
                //  FocusScope.of(context).nextFocus();
                // }
                //  }),
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
