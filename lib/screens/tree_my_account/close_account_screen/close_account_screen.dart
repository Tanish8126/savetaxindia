// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart'; // Uncomment if deleting Firestore data
import '../../../utils/constants/constants.dart';

class CloseAccountScreen extends StatefulWidget {
  static const routeName = '/close_account';
  const CloseAccountScreen({super.key});

  @override
  State<CloseAccountScreen> createState() => _CloseAccountScreenState();
}

class _CloseAccountScreenState extends State<CloseAccountScreen> {
  final TextEditingController _feedbackController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  Future<void> _deleteAccount() async {
    setState(() => _isLoading = true);
    final user = FirebaseAuth.instance.currentUser;
    try {
      // Optionally delete user data from Firestore first
      // await FirebaseFirestore.instance.collection('users').doc(user!.uid).delete();

      await user!.delete();
      setState(() => _isLoading = false);
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Account Closed'),
            content: const Text('Your account has been closed.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() => _isLoading = false);
      if (e.code == 'requires-recent-login') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please re-authenticate to close your account.'),
          ),
        );
        // You can navigate to a re-authentication screen here
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: \\${e.message}')));
      }
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: \\${e.toString()}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Close Account'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Icon(
              Icons.warning_amber_rounded,
              size: 80,
              color: Colors.redAccent,
            ),
            const SizedBox(height: 24),
            Text(
              'Are you sure you want to close your account?',
              style: tsBW(20, FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Closing your account will permanently delete your data and cannot be undone. Please let us know why you are leaving (optional):',
              style: tsCommon(16, kBlack.withValues(alpha: 0.7)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _feedbackController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Your feedback (optional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: kGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: kPrimary),
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _deleteAccount,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: tsBW(16, FontWeight.bold),
                ),
                child: _isLoading
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Close Account'),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
              child: Text('Cancel', style: tsBW(16, FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }
}
