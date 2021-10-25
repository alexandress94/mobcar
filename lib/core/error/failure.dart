abstract class Failure implements Exception{}

class ServerFailure extends Failure{

  final String message;
  ServerFailure(this.message);
}