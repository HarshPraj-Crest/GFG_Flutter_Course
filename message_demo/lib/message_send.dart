import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageSend extends StatelessWidget {
  const MessageSend({super.key});

  _sendEmail() async {
    var url = Uri.parse("mailto:harsh.praj@gmail.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _sendSMS() async {
    var url = Uri.parse("sms:9011232426");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _makeCall() async {
    var url = Uri.parse("tel:9011232426");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send message'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                onPressed: _sendEmail,
                child: const Text('Send Email'),
              ),
              const SizedBox(height: 12),
              MaterialButton(
                onPressed: _sendSMS,
                child: const Text('Send SMS'),
              ),
              const SizedBox(height: 12),
              MaterialButton(
                onPressed: _makeCall,
                child: const Text('Make Call'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
