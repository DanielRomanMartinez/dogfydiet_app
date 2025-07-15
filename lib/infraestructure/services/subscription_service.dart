import 'dart:convert';
import 'package:dogfydiet_app/domain/model/objects/subscription_form.dart';
import 'package:dogfydiet_app/domain/services/subscription_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionServiceImpl implements SubscriptionService {
  static const String _subscriptionFormKey = 'subscription_form_progress';
  static const String _currentStepKey = 'subscription_current_step';
  static const String _isFormCompleteKey = 'subscription_is_complete';

  @override
  Future<void> saveProgress(SubscriptionForm form) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_subscriptionFormKey, jsonEncode(form.toJson()));
      await prefs.setInt(_currentStepKey, form.currentStep);
      await prefs.setBool(_isFormCompleteKey, form.isCompleted);
    } catch (e) {
      throw Exception('Error saving subscription progress: $e');
    }
  }

  @override
  Future<SubscriptionForm?> getProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final formJson = prefs.getString(_subscriptionFormKey);

      if (formJson != null) {
        final formData = jsonDecode(formJson) as Map<String, dynamic>;
        return SubscriptionForm.fromJson(formData);
      }
      return null;
    } catch (e) {
      throw Exception('Error loading subscription progress: $e');
    }
  }

  @override
  Future<void> clearProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_subscriptionFormKey);
      await prefs.remove(_currentStepKey);
      await prefs.remove(_isFormCompleteKey);
    } catch (e) {
      throw Exception('Error clearing subscription progress: $e');
    }
  }

  @override
  Future<int> getCurrentStep() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt(_currentStepKey) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  @override
  Future<bool> isFormComplete() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_isFormCompleteKey) ?? false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> submitForm(SubscriptionForm form) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulating http connection delay

    if (DateTime.now().millisecondsSinceEpoch % 10 < 8) {
      await saveProgress(form.copyWith(isCompleted: true));
    } else {
      throw Exception('Network error: Failed to submit subscription');
    }
  }
}
