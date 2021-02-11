import 'dart:async';

import 'package:dome/bloc/bloc_base.dart';
import 'package:rxdart/rxdart.dart';

class DateTimeBloc extends BlocBase {
  //******************************************************************
  //*
  //*
  //******************************************************************/
  DateTime _current;
  BehaviorSubject<DateTime> _dateTimeController;

  //******************************************************************
  //*
  //*
  //******************************************************************/
  DateTimeBloc() {
    this._current = DateTime.now();
    this._dateTimeController = new BehaviorSubject.seeded(_current);
    _update();

    //_timer = new Timer(Duration(minutes: 1), () {});
  }

  //******************************************************************
  //*
  //*
  //******************************************************************/
  Stream<DateTime> get now => _dateTimeController.stream;

  //******************************************************************
  //*
  //*
  //******************************************************************/
  @override
  void dispose() {
    _dateTimeController.close();
  }

  void _update() {
    Timer.periodic(Duration(minutes: 1),
        (timer) => _dateTimeController.sink.add(DateTime.now()));
  }
}
