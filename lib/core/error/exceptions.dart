class ApiException implements Exception {}

class UnAuthorizedException implements ApiException {}

class BadRequestException implements ApiException {}

class JsonParsingException implements ApiException {}

class PhoneNumberIsAlreadyInUseException implements ApiException {}
