class ReportsResponse {
  final List<ReportFile> data;
  final String? error;
  final bool isSuccess;

  ReportsResponse({
    required this.data,
    required this.error,
    required this.isSuccess,
  });

  factory ReportsResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List<dynamic>? ?? [];
    List<ReportFile> files = list.map((e) => ReportFile.fromJson(e)).toList();

    return ReportsResponse(
      data: files,
      error: json['error'] as String?,
      isSuccess: json['isSuccess'] as bool? ?? false,
    );
  }
}

class ReportFile {
  final String fileDescription;
  final String fileTitle;
  final String fileName;
  final String fileType;
  final int attachmentContentId;

  ReportFile({
    required this.fileDescription,
    required this.fileTitle,
    required this.fileName,
    required this.fileType,
    required this.attachmentContentId,
  });

  factory ReportFile.fromJson(Map<String, dynamic> json) {
    return ReportFile(
      fileDescription: json['file_description'] as String? ?? '',
      fileTitle: json['file_title'] as String? ?? '',
      fileName: json['file_name'] as String? ?? '',
      fileType: json['file_type'] as String? ?? '',
      attachmentContentId: json['attachment_content_id'] as int? ?? 0,
    );
  }
}
