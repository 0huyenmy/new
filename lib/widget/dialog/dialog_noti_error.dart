import 'package:journal_linker/assets/index.dart';
import 'package:journal_linker/widget/button/button_primary.dart';
import 'package:flutter/material.dart';

class DialogNotiError extends StatefulWidget {
  String? content;
  double? contentSize;
  double? horizontal;
  String? txtButton;
  DialogNotiError({
    Key? key,
    this.content,
    this.contentSize,
    this.horizontal,
    this.txtButton,
  }) : super(key: key);

  @override
  State<DialogNotiError> createState() => _DialogNotiErrorState();
  static Future show(
    BuildContext context, {
    String? content,
    double? contentSize,
    double? horizontal,
    double? iconSize,
    String? txtButton,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          return WillPopScope(
              child: DialogNotiError(
                content: content,
                contentSize: contentSize,
                horizontal: horizontal,
                txtButton: txtButton,
              ),
              onWillPop: () => Future.value(true));
        });
  }
}

class _DialogNotiErrorState extends State<DialogNotiError> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontal ?? 18.sp),
      alignment: Alignment.center,
      child: Material(
        color: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        type: MaterialType.card,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.content ?? "",
                textAlign: TextAlign.center,
                maxLines: 3,
                style: TextStyle(
                  fontSize: widget.contentSize,
                  color: errorColor,
                ),
              ),
              SizedBox(
                height: 14.sp,
              ),
              ButtonPrimary(
                onPress: () {
                  Navigator.pop(context);
                },
                height: 40,
                width: 141.sp,
                text: widget.txtButton ?? '',
                textSize: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
