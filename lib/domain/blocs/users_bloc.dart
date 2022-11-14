import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../data_providers/user_data_provider.dart';
import '../entity/user.dart';

class UsersState {
  final User currentUser;

  const UsersState({
    required this.currentUser,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersState &&
          runtimeType == other.runtimeType &&
          currentUser == other.currentUser);

  @override
  int get hashCode => currentUser.hashCode;

  @override
  String toString() {
    return 'UsersState{ currentUser: $currentUser }';
  }

  UsersState copyWith({
    User? currentUser,
  }) {
    return UsersState(
      currentUser: currentUser ?? this.currentUser,
    );
  }
}

abstract class UsersEvents {}

class UsersIncrementEvent implements UsersEvents {}

class UsersDecrementEvent implements UsersEvents {}

class UsersInitializeEvent implements UsersEvents {}

class UsersBloc extends Bloc<UsersEvents, UsersState> {
  final _userDataProvider = UserDataProvider();

  UsersBloc() : super(UsersState(currentUser: User(0))) {
    on<UsersEvents>((event, emit) async {
      if (event is UsersInitializeEvent) {
        final user = await _userDataProvider.loadValue();
        emit(UsersState(currentUser: user));
      } else if (event is UsersIncrementEvent) {
        var user = state.currentUser;
        user = user.copyWith(age: user.age + 1);
        await _userDataProvider.saveValue(user);
        emit(UsersState(currentUser: user));
      } else if (event is UsersDecrementEvent) {
        var user = state.currentUser;
        user = user.copyWith(age: user.age - 1);
        await _userDataProvider.saveValue(user);
        emit(UsersState(currentUser: user));
      }
    }, transformer: sequential()); // последовательная обработка

    add(UsersInitializeEvent());

    /* -------------------------------------------------------------------------- */
    /*                         непоследовательная обработка                       */
    /* -------------------------------------------------------------------------- */
    // on<UsersInitializeEvent>((event, emit) async {
    //   final user = await _userDataProvider.loadValue();
    //   emit(UsersState(currentUser: user));
    // });
    // on<UsersIncrementEvent>((event, emit) async {
    //   var user = state.currentUser;
    //   user = user.copyWith(age: user.age + 1);
    //   await _userDataProvider.saveValue(user);
    //   emit(UsersState(currentUser: user));
    // });
    // on<UsersDecrementEvent>((event, emit) async {
    //   var user = state.currentUser;
    //   user = user.copyWith(age: user.age - 1);
    //   await _userDataProvider.saveValue(user);
    //   emit(UsersState(currentUser: user));
    // });
  }
}
/* -------------------------------------------------------------------------- */
/*                               Кастомный блок                               */
/* -------------------------------------------------------------------------- */
// UsersBloc() {
  //   _stateStream = _eventController.stream
  //       .asyncExpand<UsersState>(_mapEventToState)
  //       .asyncExpand(_updateState)
  //       .asBroadcastStream();
  //   _stateStream.listen((event) {});
  //   dispatch(UsersInitializeEvent());
  // }
  // void dispatch(UsersEvents event) {
  //   _eventController.add(event);
  // }
  // Stream<UsersState> _updateState(UsersState state) async* {
  //   if (_state == state) return;
  //   _state = state;
  //   yield state;
  // }
  // Stream<UsersState> _mapEventToState(UsersEvents event) async* {
  //   if (event is UsersInitializeEvent) {
  //     final user = await _userDataProvider.loadValue();
  //     yield UsersState(currentUser: user);
  //   } else if (event is UsersIncrementEvent) {
  //     var user = _state.currentUser;
  //     user = user.copyWith(age: user.age + 1);
  //     await _userDataProvider.saveValue(user);
  //     yield UsersState(currentUser: user);
  //   } else if (event is UsersDecrementEvent) {
  //     var user = _state.currentUser;
  //     user = user.copyWith(age: user.age - 1);
  //     await _userDataProvider.saveValue(user);
  //     yield UsersState(currentUser: user);
  //   }
  // }