import 'package:meta/meta.dart';

@immutable
class AuthUser {
  final String email, provideId, photoUrl, displayName, uid, phoneNumber;
  AuthUser({
    this.email = '',
    this.provideId = '',
    this.photoUrl = '',
    this.displayName = '',
    this.uid = '',
    this.phoneNumber = '',
  });

  factory AuthUser.fromJson(Map<String, dynamic> mapped) => AuthUser(
        email: mapped["email"],
        provideId: mapped["provideId"],
        photoUrl: mapped["photoUrl"],
        uid: mapped["uid"],
        phoneNumber: mapped["phoneNumber"],
      );

  @override
  String toString() =>
      "AuthUser{email: $email, provideId: $provideId, photoUrl: $photoUrl, displayName: $displayName, uid: $uid, phoneNumber: $phoneNumber}";
}
