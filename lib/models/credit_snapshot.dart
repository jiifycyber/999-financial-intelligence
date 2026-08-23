class CreditSnapshot {
  final String bureau;
  final int? score;
  final double utilization;
  final DateTime capturedAt;
  const CreditSnapshot(
      {required this.bureau,
      required this.score,
      required this.utilization,
      required this.capturedAt});
}
