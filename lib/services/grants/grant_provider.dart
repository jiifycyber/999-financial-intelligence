import '../../models/grant_opportunity.dart';

abstract class GrantProvider {
  String get providerName;
  Future<List<GrantOpportunity>> search(String query);
}
