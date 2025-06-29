import 'dart:developer';

import 'package:ecommerce_supabase/views/auth/logic/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  final SupabaseClient client = Supabase.instance.client;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await client.auth.signInWithPassword(email: email, password: password);
      await getUserData();
      emit(LoginSuccess());
    } on AuthException catch (e) {
      log(e.toString());
      emit(LoginError(e.message));
    } catch (e) {
      log(e.toString());
      emit(LoginError(e.toString()));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    try {
      final AuthResponse response = await client.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );

      final userId = response.user?.id;

      if (userId != null) {
        await addUserData(userId: userId, name: name, email: email);
        await getUserData();
        emit(SignUpSuccess());
      } else {
        emit(SignUpError("فشل في الحصول على معرف المستخدم."));
      }
    } on AuthException catch (e) {
      log(e.toString());
      emit(SignUpError(e.message));
    } catch (e) {
      log(e.toString());
      emit(SignUpError(e.toString()));
    }
  }

  GoogleSignInAccount? googleUser;

  Future<AuthResponse> googleSignIn() async {
    emit(GoogleSignInLoading());
    const webClientId =
        '914315616691-sjh57p035lmsr0861h3e1ppok2o67hee.apps.googleusercontent.com';
    const iosClientId = 'my-ios.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return AuthResponse();
    }

    final googleAuth = await googleUser.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      emit(GoogleSignInError());
      return AuthResponse();
    }

    final response = await client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    final userId = response.user?.id;

    if (userId != null) {
      await addUserData(
        userId: userId,
        name: googleUser.displayName ?? "غير معروف",
        email: googleUser.email,
      );
      await getUserData();
      emit(GoogleSignInSuccess());
    } else {
      emit(GoogleSignInError());
    }

    return response;
  }

  Future<void> signOut() async {
    emit(LogoutLoading());
    try {
      await client.auth.signOut();
      emit(LogoutSuccess());
    } catch (e) {
      log(e.toString());
      emit(LogoutError());
    }
  }

  Future<void> resetPassword({required String email}) async {
    emit(PasswordResetLoading());
    try {
      await client.auth.resetPasswordForEmail(email);
      emit(PasswordResetSuccess());
    } catch (e) {
      log(e.toString());
      emit(PasswordResetError());
    }
  }

  Future<void> addUserData({
    required String userId,
    required String name,
    required String email,
  }) async {
    emit(AddUserDataLoading());
    try {
      await client.from('users').upsert({
        "user_id": userId,
        "name": name,
        "email": email,
      });
      emit(AddUserDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddUserDataError());
    }
  }

  UserDataModel? userDataModel;

  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    try {
      final userId = client.auth.currentUser?.id;
      if (userId == null) {
        emit(GetUserDataError());
        return;
      }

      final data = await client
          .from('users')
          .select()
          .eq('user_id', userId)
          .limit(1)
          .single();

      userDataModel = UserDataModel(
        email: data["email"],
        name: data["name"],
        userId: data["user_id"],
      );
      emit(GetUserDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetUserDataError());
    }
  }
}
