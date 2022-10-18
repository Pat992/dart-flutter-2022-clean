abstract class Failure {}

class AuthFailure implements Failure {}

class ServerFailure extends Failure {}

class EmailAlreadyInUseFailure extends Failure {}

class InvalidEmailOrPasswordFailure extends Failure {}
