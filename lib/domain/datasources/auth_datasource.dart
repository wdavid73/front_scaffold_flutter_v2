import 'package:front_scaffold_flutter_v2/api/api.dart';

/// Defines the contract for authentication-related operations.
///
/// Implementations of this class are responsible for handling user authentication,
/// including login, registration, and authentication status verification.
abstract class AuthDataSource {
  /// Authenticates a user with the given credentials.
  ///
  /// Attempts to log in a user using their [email] and [password].
  ///
  /// Returns:
  ///   - [ResponseSuccess]: If authentication is successful, containing user data and a token.
  ///   - [ResponseFailed]: If authentication fails, containing an error message.
  ///
  /// Parameters:
  ///   - [email]: The user's email address.
  ///   - [password]: The user's password.
  ///
  Future<ResponseState> login(String email, String password);

  /// Registers a new user with the provided details.
  ///
  /// Creates a new account using the given [email], [password], and [fullName].
  ///
  /// Returns:
  ///   - [ResponseSuccess]: If registration is successful, containing user data and a token.
  ///   - [ResponseFailed]: If registration fails, containing an error message.
  ///
  /// Parameters:
  ///   - [email]: The user's email address.
  ///   - [password]: The user's chosen password.
  ///   - [fullName]: The user's full name.
  ///
  Future<ResponseState> register(
      String email, String password, String fullName);

  /// Checks the authentication status of a user.
  ///
  /// Validates whether the provided authentication [token] is still valid.
  ///
  /// Returns:
  ///   - [ResponseSuccess]: If the token is valid, containing user session details.
  ///   - [ResponseFailed]: If the token is invalid or expired, containing an error message.
  ///
  /// Parameters:
  ///   - [token]: The authentication token to verify.
  ///
  Future<ResponseState> checkAuthStatus(String token);

  /// Signs in a user with Google using the provided [idToken].
  ///
  /// This method handles the Google Sign-In process, typically by sending
  /// the [idToken] to a backend server for verification and session
  /// creation.
  ///
  /// Parameters:
  ///   - [idToken]: The Google ID token obtained from the Google Sign-In process.
  ///
  /// Returns:
  ///   - A [Future] that resolves to a [ResponseState] representing the result
  ///     of the Google Sign-In attempt.
  Future<ResponseState> googleSignIn(String idToken);
}