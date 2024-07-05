part of 'backend_information_bloc.dart';

@immutable
sealed class BackendInformationEvent {}

// final class BackendLostInformationBloc extends BackendInformationEvent {}

// final class BackendFoundInformationBloc extends BackendInformationEvent {}

final class BackendItemInformationBloc extends BackendInformationEvent {}

final class BackendProfileInformationBloc extends BackendInformationEvent {}
