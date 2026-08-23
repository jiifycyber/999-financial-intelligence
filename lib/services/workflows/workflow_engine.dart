enum WorkflowEvent {
  creditReportImported,
  disputeDraftApproved,
  grantFound,
  grantDeadlineApproaching,
  documentUploaded
}

class WorkflowEngine {
  Future<List<String>> nextActions(WorkflowEvent e) async => switch (e) {
        WorkflowEvent.creditReportImported => [
            'Analyze report',
            'Flag potential inaccuracies',
            'Create review queue'
          ],
        WorkflowEvent.disputeDraftApproved => [
            'Send through approved delivery method',
            'Record submission',
            'Start deadline tracking'
          ],
        WorkflowEvent.grantFound => [
            'Check eligibility',
            'Request missing facts',
            'Create application workspace'
          ],
        WorkflowEvent.grantDeadlineApproaching => [
            'Run completeness check',
            'Notify user',
            'Prepare final review'
          ],
        WorkflowEvent.documentUploaded => [
            'Extract metadata',
            'Classify document',
            'Attach to workflow'
          ],
      };
}
