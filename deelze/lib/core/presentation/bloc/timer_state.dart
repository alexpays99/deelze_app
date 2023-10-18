part of 'timer_bloc.dart';

class TimerState extends Equatable {
  final int duration;
  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

class Ready extends TimerState {
  const Ready(int duration) : super(duration);
}

class Paused extends TimerState {
  const Paused(int duration) : super(duration);
}

class Running extends TimerState {
  const Running(int duration) : super(duration);
}

class Finished extends TimerState {
  const Finished() : super(0);
}

// @immutable
// abstract class TimerState extends Equatable {
//   final int duration;

//   /// current value of timer to show to the UI

//   TimerState(this.duration);
//   @override

//   /// state instants compare each other by duration
//   List<Object> get props => [duration];
// }

// class Equatable {}

// class TimerInitial extends TimerState {
//   TimerInitial(duration) : super(duration);
// }

// class TimerRunInProgress extends TimerState {
//   TimerRunInProgress(int duration) : super(duration);
// }

// class TimerRunPause extends TimerState {
//   TimerRunPause(int duration) : super(duration);
// }

// class TimerRunComplete extends TimerState {
//   /// at this state, timer's value is 0
//   TimerRunComplete() : super(0);
// }
