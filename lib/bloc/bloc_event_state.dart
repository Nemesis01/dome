import 'package:meta/meta.dart';
import 'package:dome/bloc/bloc_base.dart';
import 'package:rxdart/rxdart.dart';

abstract class BlocEvent {}

abstract class BlocState {}

abstract class BlocEventStateBase<BlocEvent, BlocState> implements BlocBase {
  // #region Members
  final BlocState initialState;

  PublishSubject<BlocEvent> _eventController = PublishSubject<BlocEvent>();
  BehaviorSubject<BlocState> _stateController = BehaviorSubject<BlocState>();
  // #endregion

  // #region Constructor
  BlocEventStateBase({
    @required this.initialState,
  }) {
    _eventController.listen((BlocEvent event) {
      BlocState currentState = _stateController.value ?? initialState;
      eventHandler(event, currentState).forEach((BlocState newState) {
        _stateController.sink.add(newState);
      });
    });
  }
  // #endregion

  // #region Getters, Setters, Streams, Observables

  ///
  /// Current State / New State
  Stream<BlocState> get state => _stateController.stream;
  Stream<BlocState> eventHandler(BlocEvent event, BlocState state);

  Function(BlocEvent) get emit => _eventController.sink.add;
  // #endregion

  // #region BlocBase Interface
  @override
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
  // #endregion
}
