part of 'scroll_view_listener_bloc.dart';

sealed class ScrollViewListenerState extends Equatable {
  const ScrollViewListenerState();

  @override
  List<Object> get props => [];
}

final class ScrollViewListenerInitial extends ScrollViewListenerState {}

// this state will be emit when the scroll view is scrolled in forward direction.
final class ScrollViewListenerForwardState extends ScrollViewListenerState {}

// this state will be emit when the scroll view is scrolled in reverse direction.
final class ScrollViewListenerReverseState extends ScrollViewListenerState {
  final bool pageGoesDown;
  const ScrollViewListenerReverseState({required this.pageGoesDown});
  @override
  List<Object> get props => [pageGoesDown];
}
