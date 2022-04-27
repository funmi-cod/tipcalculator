import 'package:bloc/bloc.dart';

part 'tip_calculator_state.dart';

class TipCalculatorCubit extends Cubit<TipCalculatorState> {
  TipCalculatorCubit()
      : super(TipCalculatorState());
  // emit the new state for bill amount
  void onBillChanged(String? newBill) {
    emit(state.copyWith(billAmount: double.tryParse(newBill!) ?? state.billAmount));
  }
  // emit the new state for tip percentage
  void onTipChanged(String? newTip) {
    emit(state.copyWith(tipPercentage: double.tryParse(newTip!) ?? state.tipPercentage));
  }
}
