import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class WhatsAppOtpService {
  late TwilioFlutter twilioFlutter;

  WhatsAppOtpService() {
    twilioFlutter = TwilioFlutter(
      accountSid: dotenv.env['TWILIO_ACCOUNT_SID'] ?? '', // Fetch from .env
      authToken: dotenv.env['TWILIO_AUTH_TOKEN'] ?? '', // Fetch from .env
      twilioNumber: dotenv.env['TWILIO_PHONE_NUMBER'] ?? '', // Fetch from .env
    );
  }

  Future<bool> sendWhatsAppOtp(String phoneNumber, String otp) async {
    try {
      // Ensure phone number is in international format
      String formattedNumber = phoneNumber.startsWith('+') ? phoneNumber : '+$phoneNumber';

      // Send WhatsApp message
      await twilioFlutter.sendWhatsApp(toNumber: formattedNumber, messageBody: 'Your OTP is: $otp');

      if (kDebugMode) {
        print('WhatsApp OTP sent successfully to $formattedNumber');
      }

      return true;
    } catch (e) {
      if (kDebugMode) {
        print('Error sending WhatsApp OTP: $e');
      }
      return false;
    }
  }

  // Generate a 6-digit OTP
  String generateOtp() {
    return (100000 + Random().nextInt(900000)).toString();
  }
}
