import '../models/faq_model.dart';

class FAQDataSource {
  static List<FAQModel> getFAQs() {
    return [
      const FAQModel(
        id: '1',
        question: 'how_place_order',
        answer: 'how_place_order_answer',
        category: 'orders',
      ),
      const FAQModel(
        id: '2',
        question: 'what_payment_methods',
        answer: 'what_payment_methods_answer',
        category: 'payment',
      ),
      const FAQModel(
        id: '3',
        question: 'How do I track my order?',
        answer:
            'You can track your order in real-time through the app. Go to "My Orders" and select your order to see its current status and location.',
        category: 'orders',
      ),
      const FAQModel(
        id: '4',
        question: 'What is the delivery time?',
        answer:
            'Standard delivery takes 30-45 minutes. Express delivery is available in select areas with 15-20 minutes delivery time.',
        category: 'delivery',
      ),
      const FAQModel(
        id: '5',
        question: 'Can I cancel my order?',
        answer:
            'You can cancel your order within 5 minutes of placing it. After that, please contact customer support.',
        category: 'orders',
      ),
      const FAQModel(
        id: '6',
        question: 'How do I contact customer support?',
        answer:
            'You can contact us through the app chat, email, or phone. Our support team is available 24/7.',
        category: 'support',
      ),
    ];
  }

  static List<FAQModel> searchFAQs(String query) {
    final allFAQs = getFAQs();
    if (query.isEmpty) return allFAQs;

    return allFAQs.where((faq) {
      return faq.question.toLowerCase().contains(query.toLowerCase()) ||
          faq.answer.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  static List<FAQModel> getFAQsByCategory(String category) {
    return getFAQs().where((faq) => faq.category == category).toList();
  }
}
