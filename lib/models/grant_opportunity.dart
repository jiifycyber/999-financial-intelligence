class GrantOpportunity {
  final String id, title, funder, source;
  final DateTime? deadline;
  final double fitScore;
  const GrantOpportunity(
      {required this.id,
      required this.title,
      required this.funder,
      this.deadline,
      required this.fitScore,
      required this.source});
}
