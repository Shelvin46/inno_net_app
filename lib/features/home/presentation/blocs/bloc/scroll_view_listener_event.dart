part of 'scroll_view_listener_bloc.dart';

sealed class ScrollViewListenerEvent extends Equatable {
  const ScrollViewListenerEvent();

  @override
  List<Object> get props => [];
}

// this event will be called when the scroll view is scrolled in forward direction.
class ScrollViewListenerForward extends ScrollViewListenerEvent {}

// this event will be called when the scroll view is scrolled in reverse direction.
class ScrollViewListenerReverse extends ScrollViewListenerEvent {}
