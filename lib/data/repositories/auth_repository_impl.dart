import 'package:front_scaffold_flutter_v2/api/api.dart';
import 'package:front_scaffold_flutter_v2/domain/datasources/auth_datasource.dart';
import 'package:front_scaffold_flutter_v2/domain/repositories/auth_repository.dart';

/// Implementation of [AuthRepository] that interacts with an authentication data source.
///
/// This class acts as an intermediary between the domain layer and the data layer,
/// delegating authentication operations to an [AuthDataSource] instance.
class AuthRepositoryImpl extends AuthRepository {
  /// The data source responsible for handling authentication requests.
  final AuthDataSource datasource;

  /// Creates an instance of [AuthRepositoryImpl] with the provided [datasource].
  AuthRepositoryImpl(this.datasource);

  /// Checks the authentication status of a user.
  ///
  /// Delegates the call to [AuthDataSource.checkAuthStatus].
  ///
  /// Parameters:
  ///   - [token]: The authentication token to verify.
  ///
  /// Returns:
  ///   - [ResponseSuccess]: If the token is valid, containing user session details.
  ///   - [ResponseFailed]: If the token is invalid or expired, containing an error message.
  @override
  Future<ResponseState> checkAuthStatus(String token) {
    return datasource.checkAuthStatus(token);
  }

  /// Authenticates a user with the given credentials.
  ///
  /// Delegates the call to [AuthDataSource.login].
  ///
  /// Parameters:
  ///   - [email]: The user's email address.
  ///   - [password]: The user's password.
  ///
  /// Returns:
  ///   - [ResponseSuccess]: If authentication is successful, containing user data and a token.
  ///   - [ResponseFailed]: If authentication fails, containing an error message.
  @override
  Future<ResponseState> login(String email, String password) {
    return datasource.login(email, password);
  }

  /// Registers a new user with the provided details.
  ///
  /// Delegates the call to [AuthDataSource.register].
  ///
  /// Parameters:
  ///   - [email]: The user's email address.
  ///   - [password]: The user's chosen password.
  ///   - [fullName]: The user's full name.
  ///
  /// Returns:
  ///   - [ResponseSuccess]: If registration is successful, containing user data and a token.
  ///   - [ResponseFailed]: If registration fails, containing an error message.
  @override
  Future<ResponseState> register(
      String email, String password, String fullName) {
    return datasource.register(email, password, fullName);
  }

  /// Signs in a user with Google using the provided [idToken].
  ///
  /// Delegates the authentication process to the [AuthDataSource] instance.
  ///
  /// Parameters:
  ///   - [idToken]: The Google ID token obtained from the Google Sign-In process.
  ///
  /// Returns:
  ///   - A [Future] that resolves to a [ResponseState] representing the result
  ///     of the Google Sign-In attempt.
  @override
  Future<ResponseState> googleSignIn(String idToken) {
    return datasource.googleSignIn(idToken);
  }
}