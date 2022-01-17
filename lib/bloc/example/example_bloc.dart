import 'package:bloc/bloc.dart';
import 'package:doctor_app/network/api_provider.dart';
import './bloc.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(InitialExampleState()) {
    on<GetExample>(_getExample);
    on<PostExample>(_postExample);
  }
}

void _getExample(GetExample event, Emitter<ExampleState> emit) async {
  ApiProvider _apiProvider = ApiProvider();

  emit(ExampleWaiting());
  try {
    String data = await _apiProvider.getExample(event.apiToken);
    emit(GetExampleSuccess(exampleData: data));
  } catch (ex) {
    if (ex != 'cancel') {
      emit(ExampleError(errorMessage: ex.toString()));
    }
  }
}

void _postExample(PostExample event, Emitter<ExampleState> emit) async {
  ApiProvider _apiProvider = ApiProvider();

  emit(ExampleWaiting());
  try {
    String data = await _apiProvider.postExample(event.id, event.apiToken);
    emit(PostExampleSuccess(exampleData: data));
  } catch (ex) {
    if (ex != 'cancel') {
      emit(ExampleError(errorMessage: ex.toString()));
    }
  }
}
