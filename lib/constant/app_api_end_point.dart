import 'package:flutter/foundation.dart';
import 'package:magic_app/utils/error_log.dart';

class AppApiEndPoint {
  AppApiEndPoint._privateConstructor();
  static final AppApiEndPoint _instance = AppApiEndPoint._privateConstructor();
  static AppApiEndPoint get instance => _instance;

  //app use base
  final String domain = _getDomain();
  final String baseUrl = "${_getDomain()}/api/v1";
  final String liveServer = "http://10.10.7.93:5000/api/v1";

  ////////// ================= Auth Endpoints  ==============  //////////////////
  String login = "/auth/login";
  String userSignUp = "/users"; // Sign up endpoint (POST)
  String authForgotPassword =
      "/auth/forget-password"; // Forgot password - send email
  String authVerifyPhone = "/auth/verify-account"; // Verify OTP
  String userResendOtp = "/auth/resend-otp";
  String authResetPassword = "/auth/reset-password";
  final String notifications = '/notifications';
  String get markAllNotificationsRead => '$baseUrl/notifications';
  String get markOneNotificationRead => '$baseUrl/notifications';

  ////////// ================= Main Home flow Endpoints  ==============  //////////////////

  final String activeLottery = '/lottery/active';
  final String settings = '/settings';
  final String participants = '/participants';

  final String myParticipated = '/participants/my-participated';
  final String participationDetails = '/participants/my-participations';
  // details call হবে: '/participants/my-participations/$participantId'

  ////////// ================= Profile Endpoints  ==============  //////////////////
  final String userProfile = '/users/profile'; // GET
  final String updateProfile = '/users'; // PATCH
  final String changePassword = '/auth/change-password';
  final String faqs = '/faqs';
  final String aboutUs = '/rules/about';
  final String termsAndConditions = '/rules/terms';
  final String privacyPolicy = '/rules/privacy';
  String get contactSupport => '/supports';
}

String _getDomain() {
  String liveServer = "http://10.10.7.93:5000";
  String localServer = "http://10.10.7.93:5000";

  try {
    if (kDebugMode) {
      return localServer;
    }
    return liveServer;
  } catch (e) {
    errorLog("_getDomain", e);
    return liveServer;
  }
}
