part of 'timer_bloc.dart';

class TimerEvent extends Equatable {
  const TimerEvent();
  @override
  List<Object> get props => [];
}

class Start extends TimerEvent {
  final int duration;
  const Start({required this.duration});
  @override
  String toString() {
    return "Start {duration: $duration}";
  }
}

class Pause extends TimerEvent {}

class Resume extends TimerEvent {}

class Reset extends TimerEvent {}

class Tick extends TimerEvent {
  final int duration;
  const Tick({required this.duration});
  @override
  List<Object> get props => [duration];
  @override
  String toString() {
    return "Tick {duration : $duration}";
  }
}

// abstract class TimerEvent extends Equatable {
//   TimerEvent();

//   @override
//   List<Object> get props => [];
// }

// class TimerStarted extends TimerEvent {
//   final int duration;
//   TimerStarted(this.duration);
// }

// class TimerPaused extends TimerEvent {
//   TimerPaused();
// }

// class TimerResumed extends TimerEvent {
//   final int duration;
//   TimerResumed(this.duration);
// }

// class TimerReset extends TimerEvent {}

// class TimerTicked extends TimerEvent {
//   final int duration;
//   TimerTicked(this.duration);

//   @override
//   List<Object> get props => [duration];
// }
