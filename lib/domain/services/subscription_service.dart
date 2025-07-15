import 'package:dogfydiet_app/domain/model/objects/subscription_form.dart';

abstract class SubscriptionService {
  Future<void> saveProgress(SubscriptionForm form);
  Future<SubscriptionForm?> getProgress();
  Future<void> clearProgress();
  Future<int> getCurrentStep();
  Future<bool> isFormComplete();
  Future<void> submitForm(SubscriptionForm form);
}