part of 'quotes_bloc.dart';

sealed class QuotesState extends Equatable {
  const QuotesState();

  @override
  List<Object> get props => [];
}

class LoadingState extends QuotesState {}

class LoadedState extends QuotesState {
  final List<QuotesModel> quote;
  final Color color;

  const LoadedState(this.color, {required this.quote});

  @override
  List<Object> get props => [quote];
}

class ErrorState extends QuotesState {
  final String message;

  const ErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
