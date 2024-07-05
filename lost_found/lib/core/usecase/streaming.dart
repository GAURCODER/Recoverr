abstract interface class Streaming<SuccessType, Params> {
  Stream<SuccessType> call(Params params);
}

class StreamParams {}