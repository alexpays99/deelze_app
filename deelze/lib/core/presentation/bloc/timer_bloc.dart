import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deelze/core/helpers/ticker.dart';
import 'package:equatable/equatable.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final int _duration = 60;
  final Ticker _ticker;
  late StreamSubscription<int> _tickerSubscription =
      _ticker.tick(ticks: _duration).listen((duration) {
    add(Tick(duration: duration));
  });

  TimerState get initialState => Ready(_duration);
  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const Ready(60)) {
    // _tickerSubscription = _ticker.tick(ticks: _duration).listen((duration) {
    //   add(Tick(duration: duration));
    // });

    on<Start>((event, emit) {
      emit(Running(event.duration));
      _tickerSubscription.cancel();
      _tickerSubscription =
          _ticker.tick(ticks: event.duration).listen((duration) {
        add(Tick(duration: duration));
      });
    });
    on<Pause>((event, emit) {
      _tickerSubscription.pause();
      emit(Paused(state.duration));
    });
    on<Resume>((event, emit) {
      _tickerSubscription.resume();
      emit(Running(state.duration));
    });
    on<Reset>((event, emit) {
      _tickerSubscription.cancel();
      emit(Ready(state.duration));
    });
    on<Tick>((event, emit) {
      emit(event.duration > 0 ? Running(event.duration) : const Ready(60));
    });
  }

  // Stream<TimerState> mapEventToState(TimerEvent event) async* {
  //   Stream<TimerState> mapEventToState(TimerEvent event) async* {
  //     if (event is Start) {
  //       yield Running(event.duration);
  //       _tickerSubscription.cancel();
  //       _tickerSubscription =
  //           _ticker.tick(ticks: event.duration).listen((duration) {
  //         add(Tick(duration: duration));
  //       });
  //     } else if (event is Pause && state is Running) {
  //       _tickerSubscription.pause();
  //       yield Paused(state.duration);
  //     } else if (event is Resume && state is Paused) {
  //       _tickerSubscription.resume();
  //       yield Running(state.duration);
  //     } else if (event is Reset) {
  //       _tickerSubscription.cancel();
  //       yield Ready(_duration);
  //     } else if (event is Tick) {
  //       yield event.duration > 0 ? Running(event.duration) : const Finished();
  //     }
  //   }
  // }

  // @override
  // Future<void> close() {
  //   _tickerSubscription.cancel();
  //   return super.close();
  // }
}

// class TimerBloc extends Bloc<TimerEvent, TimerState> {
//   final Ticker _ticker;
//   static const _duration = 60;

//   /// counting down from 60

//   /// to listen to the ticker stream
//   StreamSubscription<int>? _tickerSubscription;

//   TimerBloc({required Ticker ticker})
//       : _ticker = ticker,

//         /// we have to specify the initial stage
//         super(TimerInitial(_duration)) {
//     on<TimerStarted>(_onStarted);
//     on<TimerTicked>(_onTicked);
//     on<TimerPaused>(_onPaused);
//     on<TimerResumed>(_onResumed);
//     on<TimerReset>(_onReset);
//   }

//   @override
//   Future<void> close() {
//     _tickerSubscription?.cancel();
//     return super.close();
//   }

//   void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
//     /// In case of there is an subscription exists, we have to cancel it
//     _tickerSubscription?.cancel();

//     /// triggers the TimerRunInProgress state
//     emit(TimerRunInProgress(event.duration));

//     /// makes the subscription listen to TimerTicked state
//     _tickerSubscription = _ticker
//         .tick(ticks: event.duration)
//         .listen((duration) => add(TimerTicked(duration)));
//   }

//   void _onTicked(TimerTicked event, Emitter<TimerState> emit) {
//     emit(event.duration > 0
//         ? TimerRunInProgress(event.duration)

//         /// triggers the TimerRunInProgress state
//         : TimerRunComplete());

//     /// triggers TimerRunComplete state
//   }

//   void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
//     /// As the timer pause, we should pause the subscription also
//     _tickerSubscription?.pause();
//     emit(TimerRunPause(state.duration));

//     /// triggers the TimerRunPause state
//   }

//   void _onResumed(TimerResumed event, Emitter<TimerState> emit) {
//     /// As the timer resume, we must let the subscription resume also
//     _tickerSubscription?.resume();
//     emit(TimerRunInProgress(state.duration));

//     /// triggers the TimerRunInProgress state
//   }

//   void _onReset(TimerReset event, Emitter<TimerState> emit) {
//     /// Timer counting finished, so we must cancel the subscription
//     _tickerSubscription?.cancel();
//     emit(TimerInitial(_duration));

//     /// triggers the TimerInitial state
//   }
// }
