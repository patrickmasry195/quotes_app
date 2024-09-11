import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes_app/constants.dart';
import 'package:quotes_app/models/quotes_model.dart';
import 'package:quotes_app/services/quotes_service.dart';

part 'quotes_event.dart';
part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  final QuotesService quotesService;

  QuotesBloc({required this.quotesService}) : super(LoadingState()) {
    on<QuotesEvent>(
      (event, emit) async {
        if (event is GetQuoteEvent) {
          emit(LoadingState());
          try {
            final singleQuote = await quotesService.getQuote();
            final newColor = _generateRandomColor();
            emit(LoadedState(quote: singleQuote, newColor));
          } catch (e) {
            emit(const ErrorState(
                message: "Something went wrong, Please Try again latter"));
          }
        }
      },
    );
  }

  Color _generateRandomColor() {
    Random random = Random();
    return kColors[random.nextInt(kColors.length)];
  }
}
