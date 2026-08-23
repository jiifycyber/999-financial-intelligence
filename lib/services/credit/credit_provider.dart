import '../../models/credit_snapshot.dart';

abstract class CreditProvider {
  String get providerName;
  Future<List<CreditSnapshot>> getConsumerCredit(String consumerId);
}
