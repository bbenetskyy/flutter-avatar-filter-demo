class AvatarException implements Exception {
  final String message;
  const AvatarException(this.message);

  @override
  String toString() => message;
}
