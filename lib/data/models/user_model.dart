// models/user.dart

class Member {
  final String username;
  final String email;
  final String password;
  final String id;

  Member(
      {required this.username,
        required this.email,
        required this.password,
        required this.id});
}

List<Member> dummyMembers = [
  Member(
      username: 'Andika',
      email: 'dk@pam.com',
      password: 'pamm123',
      id: 'al baqarah : 100'),
  Member(
      username: 'Lintang',
      email: 'lyn@pam.com',
      password: 'pamm123',
      id: 'an nissa : 56'),
];
