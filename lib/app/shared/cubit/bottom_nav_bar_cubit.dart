import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());
  int currentIndex = 0;

  setCurrentIndex(index) {
    emit(BottomNavBarFetch());
    currentIndex = index;
    emit(BottomNavBarFetched());
  }
}
