import 'package:google_sign_in/google_sign_in.dart';
import 'package:rehlaa/features/authentication/data/repositories/mock_auth_repository.dart';
import 'package:rehlaa/features/authentication/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) => MockAuthRepository();

@riverpod
GoogleSignIn googleSignIn(Ref ref) => GoogleSignIn(
      scopes: ['email', 'profile'],
    );
