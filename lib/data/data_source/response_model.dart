class ResponseModel<T> {
  late StateData status;
  late T data;
  late String message;

  ResponseModel.loading() : status = StateData.LOADING;

  ResponseModel.completed(this.data) : status = StateData.COMPLETED;

  ResponseModel.error(this.message) : status = StateData.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum StateData { LOADING, COMPLETED, ERROR }
