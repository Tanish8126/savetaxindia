import 'package:flutter/material.dart';

import '../../../../utils/constants/constants.dart';
import 'language_list.dart';

class ChangeLanguageBody extends StatefulWidget {
  const ChangeLanguageBody({super.key});

  @override
  State<ChangeLanguageBody> createState() => _ChangeLanguageBodyState();
}

class _ChangeLanguageBodyState extends State<ChangeLanguageBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pda(0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Text(
            'Select your preferred language',
            style: tsBW(20, FontWeight.bold),
          ),
          sh02,
          Expanded(
            child: ListView.separated(
              itemCount: languages.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final lang = languages[index];
                return ListTile(
                  title: Text(lang, style: tsBW(16, FontWeight.w500)),
                  trailing: Radio<String>(
                    value: lang,
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value!;
                      });
                    },
                    activeColor: kPrimary,
                  ),
                  onTap: () {
                    setState(() {
                      selectedLanguage = lang;
                    });
                  },
                );
              },
            ),
          ),
          sh02,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Save/apply language logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Language changed to $selectedLanguage'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: pda(0.02),
                backgroundColor: kPrimary,
                textStyle: tsBW(16, FontWeight.bold),
              ),
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
