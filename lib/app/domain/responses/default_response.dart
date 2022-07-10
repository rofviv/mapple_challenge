class DefaultResponse<T> {
  int status;
  String message;
  T data;

  DefaultResponse(this.status, this.message, this.data);
}
