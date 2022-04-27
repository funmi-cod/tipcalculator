part of 'tip_calculator_cubit.dart';

class TipCalculatorState {
  static const defaultTip = 0.15;
  static const  defaultBill = 0.00 ;
  final double? billAmount;
  final double? tipPercentage;

  TipCalculatorState({this.billAmount = defaultBill, this.tipPercentage =defaultTip});


  TipCalculatorState copyWith({double? billAmount, double? tipPercentage }) {
   return TipCalculatorState(
     tipPercentage: tipPercentage?? this.tipPercentage,
     billAmount:  billAmount?? this.billAmount,
   );

  }
  // calculate Tip amount
  double get calculateTipAmount => billAmount! * tipPercentage!;

  // calculate Bill amount
  double get calculateBillAmount => billAmount! + calculateTipAmount;
}
