import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_go_fast/app/core/errors/login_usuario_senha_error_interceptor.dart';
import 'package:flutter_go_fast/app/core/errors/register_error_interceptor.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/responses/default_response.dart';
import '../core/responses/response_builder.dart';
import '../interfaces/auth_repository_interface.dart';

///Classe que trata das operações de Registro e Login
class AuthRepository implements IAuthRepository {
  final FirebaseAuth firebaseAuth;
  AuthRepository(this.firebaseAuth);

  @override
  Future<DefaultResponse> doLoginEmailPassword(
      {String email, String passoword}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: passoword.trim());

      return ResponseBuilder.success<User>(object: firebaseAuth.currentUser);
    } on FirebaseAuthException catch (e) {
      return ResponseBuilder.failed(
          object: e,
          message: e.toString(),
          errorInterceptor: LoginUsuarioSenhaErrorInterceptor());
    }
  }

  @override
  Future<DefaultResponse> doLoginGoogle() async {
    try {
      final googleSignIn = GoogleSignIn();

      final googleSignInAccount = await googleSignIn.signIn();

      final googleSignInAuthentication =
          await googleSignInAccount.authentication;

      User firebaseUser;

      if (googleSignInAuthentication.accessToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);
        await firebaseAuth
            .signInWithCredential(credential)
            .then((auth) => firebaseUser = auth.user);
      }
      return ResponseBuilder.success<User>(
          object: firebaseUser, message: 'Logou com sucesso');
    } on Exception catch (e) {
      return ResponseBuilder.failed(
          object: e,
          message: e.toString(),
          errorInterceptor: RegisterErrorInterceptor());
    }
  }

  @override
  Future<DefaultResponse> getUser() async {
    try {
      return ResponseBuilder.success<User>(object: firebaseAuth.currentUser);
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> logout() async {
    try {
      firebaseAuth.signOut();
      return ResponseBuilder.success();
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> registerEmailPassword(
      {String email, String password}) async {
    try {
      return await firebaseAuth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((auth) {
        return ResponseBuilder.success<User>(object: auth.user);
      });
    } on Exception catch (e) {
      return ResponseBuilder.failed(
          object: e,
          message: e.toString(),
          errorInterceptor: RegisterErrorInterceptor());
    }
  }
}
