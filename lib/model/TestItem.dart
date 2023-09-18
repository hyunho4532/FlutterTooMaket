
class TestItem {
  String label;
  dynamic value;
  TestItem({
    required this.label,
    this.value
  });

  factory TestItem.fromJson(Map<String, dynamic> json) {
    return TestItem(
        label: json['label'],
        value: json['value']
    );
  }
}