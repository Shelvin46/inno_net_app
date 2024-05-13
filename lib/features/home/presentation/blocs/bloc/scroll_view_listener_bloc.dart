import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'scroll_view_listener_event.dart';
part 'scroll_view_listener_state.dart';

///[ScrollViewListenerBloc] is a class that is used to handle the scroll view listener.
/// in the [HomeScreen] if the scroll view is scrolled then the listener will be called.
/// according to the reverse and forward scroll the bottom navigation bar will be hidden and shown.

class ScrollViewListenerBloc
    extends Bloc<ScrollViewListenerEvent, ScrollViewListenerState> {
  ScrollViewListenerBloc() : super(ScrollViewListenerInitial()) {
    // if the scroll view is scrolled in forward direction then emit the [ScrollViewListenerForwardState]
    on<ScrollViewListenerForward>((event, emit) {
      emit(ScrollViewListenerForwardState());
    });
    // if the scroll view is scrolled in reverse direction then emit the [ScrollViewListenerReverseState]
    on<ScrollViewListenerReverse>((event, emit) {
      emit(const ScrollViewListenerReverseState(pageGoesDown: true));
    });
  }
}
