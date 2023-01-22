import 'package:flutter/material.dart';

class AdviceUseCase {
  Future<String> getAdvice() async {
      // Call a repository to get data (failure or data
      // proceed with business logic (manipulate de data)
      // for example get and advice
      debugPrint('fake get advice triggered!');
      await Future.delayed(const Duration(seconds: 3), () {});
      return 'Fake advice to test';
  }
}
