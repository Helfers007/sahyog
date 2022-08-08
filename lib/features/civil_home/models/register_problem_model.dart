class RegisterProblem {
  final String by;
  final String textMessage;
  final double latitude;
  final double longitude;
  final String address;
  final int numOfPerson;

  RegisterProblem(
      {required this.textMessage,
      required this.latitude,
      required this.by,
      required this.longitude,
      required this.address,
      required this.numOfPerson});
}
