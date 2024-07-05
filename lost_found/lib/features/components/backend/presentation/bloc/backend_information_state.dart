part of 'backend_information_bloc.dart';

@immutable
sealed class BackendInformationState {}

final class BackendInformationInitial extends BackendInformationState {}

final class BackendInformationLoading extends BackendInformationState {}

final class BackendInformationFailure extends BackendInformationState {
  final String message;
  BackendInformationFailure(this.message);
}

// final class BackendInformationLostSuccess extends BackendInformationState {
//   final List<LostItem> lostItem;
//   BackendInformationLostSuccess(this.lostItem);
// }

// final class BackendInformationFoundSuccess extends BackendInformationState {
//   final List<FoundItem> foundItem;
//   BackendInformationFoundSuccess(this.foundItem);
// }

final class BackendInformationSuccess extends BackendInformationState {
  final List<CombinedLostFound> item;
  BackendInformationSuccess(this.item);
}

final class BackendInformationProfileSuccess extends BackendInformationState {
  final List<User> profile;
  BackendInformationProfileSuccess(this.profile);
}
