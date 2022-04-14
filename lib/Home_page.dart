import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // default bill amount
  static const defaultBill = 0.00;
  // default tip percentage
  static const defaultTip = 0.15;

  // TextEditingController keeps track of changes in the textField
  final billController = TextEditingController(text: defaultBill.toString());
  final tipController = TextEditingController(text: defaultTip.toString());

  // Stores the latest value of bill amount
  double billAmount = defaultBill;
  //Store the latest value of tip percentage
  double tipPercentage = defaultBill;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    billController.addListener(onBillChanged);
    tipController.addListener(onTipChanged);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        title: const Text('Tip Calculator', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(
              width: 150,
              child: TextField(
                key: const Key("billAmount"),
                controller: billController,
                textAlign: TextAlign.center,
                // allow user to enter only number plus decimal points
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    hintText: '\$0.00',
                    labelText: "Bill Amount"
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 150,
              child: TextField(
                key: const Key("tipPercentage"),
                controller: tipController,
                textAlign: TextAlign.center,
                // allow user to enter only number plus decimal points
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    hintText: '0.00',
                    labelText: "Tip Percentage"
                ),
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
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text("Tip Amount:\$${_calculateTipAmount()}",
                  style: const TextStyle(color: Colors.white, fontSize: 16),textAlign: TextAlign.center,)),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 50,
                width: 200,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text("Total Amount: \$${_calculateTotalAmount()}",
                  style: const TextStyle(color: Colors.white, fontSize: 16),textAlign: TextAlign.center,)),

          ],
        ),
      ),
    );
  }


  // Notify flutter that bill amount has changed
  // Thus, a rebuild is done to update the value
  void onBillChanged() {
    setState(() {
      billAmount = double.tryParse(billController.text) ?? 0.00;
    });
  }

  // Notify flutter that tip percentage has changed
  // Thus, a rebuild is done to update the value
  void onTipChanged(){
    setState(() {
      tipPercentage = double.tryParse(tipController.text) ?? 0.00;
    });
  }
  // A method to calculate the tip amount
  _calculateTipAmount() => billAmount * tipPercentage;
  // A method to calculate the total amount
  _calculateTotalAmount() => billAmount + _calculateTipAmount();

  // Dispose used TextEditingController
  // when widget is cleared from memory
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    billController.dispose();
    tipController.dispose();
  }
}
