import '/ui/screen.dart';
import 'package:flutter/material.dart';

Future<bool?> showConfirmDialog(BuildContext context, String message) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Xác nhận xóa'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.mainColor)),
          child: SmallText(
            text: 'Có',
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(ctx).pop(true);
          },
        ),
        TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.mainColor)),
          child: SmallText(
            text: 'Không',
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(ctx).pop(false);
          },
        ),
      ],
    ),
  );
}

Future<void> showErrorDialog(BuildContext context, String message) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Lỗi khi xử lý!'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.of(ctx).pop();
          },
        ),
      ],
    ),
  );
}
