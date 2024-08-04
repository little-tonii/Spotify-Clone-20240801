import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/datasources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';
import 'package:spotify_clone/data/models/auth/signin_user_req.dart';
import 'package:spotify_clone/domain/repositories/auth/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }
}
