class InstallmentsModel {
  final int? id;
  final double monthlyinstallment;
  final String dateTime;
  final String comments;

  InstallmentsModel({
    this.id,
    required this.monthlyinstallment,
    required this.dateTime,
    required this.comments,
  });

  toMap() {
    return {
      'id': id,
      'monthlyinstallment': monthlyinstallment,
      'dateTime': dateTime,
      'comments': comments,
    };
  }
}
