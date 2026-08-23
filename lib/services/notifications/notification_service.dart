class NotificationService {
  Future<void> queueReminder(
      String userId, String message, DateTime dueAt) async {
    // Route through secure server-side email/SMS/push connector.
  }
}
