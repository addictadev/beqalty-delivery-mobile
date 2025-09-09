class FAQModel {
  final String id;
  final String question;
  final String answer;
  final String category;

  const FAQModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.category,
  });

  factory FAQModel.fromJson(Map<String, dynamic> json) {
    return FAQModel(
      id: json['id'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'category': category,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FAQModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
