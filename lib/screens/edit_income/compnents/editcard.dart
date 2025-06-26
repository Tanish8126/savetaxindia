// Helper for info cards
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';

Widget editCard({
  required String title,
  required String amount,
  required BuildContext context,
  required VoidCallback onEdit,
  required VoidCallback onAdd,
}) {
  return Container(
    decoration: BoxDecoration(
      color: kWhite,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
      ],
    ),
    child: Expanded(
      child: ListTile(
        title: Row(
          children: [
            Text(title, style: tsBW(16, FontWeight.bold)),
            IconButton(
              icon: Icon(Icons.info, size: 16, color: Colors.green.shade700),
              onPressed: () {
                dialogBox(context, title, amount);
              },
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.edit, color: Colors.green.shade700),
          onPressed: onEdit,
        ),
        subtitle: TextFormField(
          //   initialValue: "₹ $amount",
          style: tsBW(21, FontWeight.bold),
          keyboardType: TextInputType.number,

          decoration: InputDecoration(
            contentPadding: pdo(0, 0, 0, 0),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: kWhite),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: kWhite),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: kWhite),
            ),
            hintText: amount == "" ? "Enter Amount" : "₹ $amount",
          ),
        ),
      ),
    ),
  );
}

Future<dynamic> dialogBox(BuildContext context, String title, String amount) {
  return showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(amount),
      actions: [
        CupertinoDialogAction(
          child: Text("Close"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}
