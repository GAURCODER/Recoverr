import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:lost_found/core/usecase/usecase.dart';
import 'package:lost_found/core/common/entities/user.dart';
import 'package:lost_found/features/auth/domain/usecases/current_user.dart';
import 'package:lost_found/features/auth/domain/usecases/sign_out.dart';
import 'package:lost_found/features/auth/domain/usecases/user_login.dart';
import 'package:lost_found/features/auth/domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;
  final SignOut _signOut;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogin userLogin,
    required CurrentUser currentUser,
    required AppUserCubit appUserCubit,
    required SignOut signOut,
  })  : _userSignUp = userSignUp,
        _userLogin = userLogin,
        _currentUser = currentUser,
        _appUserCubit = appUserCubit,
        _signOut = signOut,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthSignOut>(_isSignOut);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

  void _isSignOut(AuthSignOut event, Emitter<AuthState> emit) async {
    final res = await _signOut(NoParams());
    res.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => emit(AuthLogout()),
    );
  }

  void _isUserLoggedIn(
      AuthIsUserLoggedIn event, Emitter<AuthState> emit) async {
    final res = await _currentUser(NoParams());
    res.fold((l) {
      emit(AuthFailure(l.message));
    }, (r) {
      _appUserCubit.updateUser(r);
      emit(AuthSuccess(r));
    });
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    final response = await _userSignUp(
      UserSignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );

    response.fold(
      (failure) {
        emit(AuthSignUpFailure(failure.message));
      },
      (user) {
        emit(AuthSignUpSuccess(user));
      },
    );
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    final response = await _userLogin(
      UserLoginParams(
        email: event.email,
        password: event.password,
      ),
    );

    response.fold(
      (failure) {
        // print('Authentication failed: ${failure.message}');
        emit(AuthLoginFailure(failure.message));
      },
      (user) {
        // print('Authentication successful. UID: $user');
        emit(AuthLoginSuccess(user));
      },
    );
  }
}
