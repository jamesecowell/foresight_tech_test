import 'package:bloc/bloc.dart';

class MySimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('bloc: $bloc, transition: $transition');
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('$error, $stackTrace');
  }
}
