import 'package:advicer/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../entities/advice_entity.dart';

class AdviceUseCases {
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    // Call a repository to get data (failure or data
    // proceed with business logic (manipulate de data)
    // for example get and advice
    debugPrint('fake get advice triggered!');
    await Future.delayed(const Duration(seconds: 3), () {});
    //return right(const AdviceEntity(advice: 'advice to test', id: 1));
    return left(ServerFailure());
  }
}
