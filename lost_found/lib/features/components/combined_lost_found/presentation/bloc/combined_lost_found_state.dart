part of 'combined_lost_found_bloc.dart';

@immutable
sealed class CombinedLostFoundState {}

final class CombinedLostFoundInitial extends CombinedLostFoundState {}

final class CombinedLostFoundLoading extends CombinedLostFoundState {}

final class CombinedLostFoundFailure extends CombinedLostFoundState {
  final String message;
  CombinedLostFoundFailure(this.message);
}

final class CombinedClaimedItemFailure extends CombinedLostFoundState {
  final String message;
  CombinedClaimedItemFailure(this.message);
}

final class CombinedLostFoundSuccess extends CombinedLostFoundState {}

final class CombinedClaimedItemSuccess extends CombinedLostFoundState {}
