import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tipcalculator/business_logic/cubit/tip_calculator_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // creating Cubit instance
  late final TipCalculatorCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = TipCalculatorCubit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cubit.close(); // this will do some clean up on the internal variables
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        title: const Text(
          'Tip Calculator',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child: TextField(
                key: const Key("billAmount"),
                //get the latest value and pass to the method
                onChanged: cubit.onBillChanged, // same type
                textAlign: TextAlign.center,
                // allow user to enter only number plus decimal points
                keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    hintText: '\$0.00', labelText: "Bill Amount"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 150,
              child: TextField(
                key: const Key("tipPercentage"),
                onChanged: cubit.onTipChanged,
                textAlign: TextAlign.center,
                // allow user to enter only number plus decimal points
                keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    hintText: '0.00', labelText: "Tip Percentage"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 50,
                width: 200,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: BlocBuilder<TipCalculatorCubit,TipCalculatorState>(
                  bloc: cubit,
                  builder: (context, state) =>Text(
                    "Tip Amount:\$${state.calculateTipAmount}",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ), )

                ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 200,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: BlocBuilder<TipCalculatorCubit,TipCalculatorState>(
                bloc: cubit,
                builder: (context,state) =>Text(
                  "Total Amount: \$${state.calculateBillAmount}",
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Text(
              "Total Amount",
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

}


