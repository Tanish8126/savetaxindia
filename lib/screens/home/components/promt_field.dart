import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';

class PromptField extends StatelessWidget {
  const PromptField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: pds(0.02, 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello", style: tsB(18)),
            sh01,
            TextFormField(
              textAlign: TextAlign.left,
              textCapitalization: TextCapitalization.words,
              maxLength: 250,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: "I Spit it out.....",
                filled: true,
                fillColor: kBlack.withValues(alpha: 0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: kBlack.withValues(alpha: 0.6)),
                ),
                hintStyle: tsCommon(16, kBlack.withValues(alpha: 0.6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
