class CreateUserReq {
  String email;
  String fullName;
  String password;

  CreateUserReq({
    required this.email,
    required this.fullName,
    required this.password,
  });
}
