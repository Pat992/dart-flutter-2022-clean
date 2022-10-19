abstract class Failure {}

class AuthFailure implements Failure {}

class ServerFailure extends Failure {}

class EmailAlreadyInUseFailure extends Failure {}

class InvalidEmailOrPasswordFailure extends Failure {}

class InsufficientPermissionsFailure extends Failure {}

class TodoFailure extends Failure {}

class UnexpectedFailure extends Failure {}
