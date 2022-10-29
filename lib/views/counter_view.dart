import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 0;

  void increaseCounter() {
    setState(() {
      counter++;
    });
  }

  void decreaseCounter() {
    setState(() {
      counter--;
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        elevation: 10,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Clicks Counter', style: fontSize30,),
            Text('$counter', style: fontSize30,)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingButtons(
        increaseFn: increaseCounter,
        decreaseFn: decreaseCounter,
        resetFn: resetCounter,
      ),
    );
  }
}

class CustomFloatingButtons extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const CustomFloatingButtons({super.key, required this.increaseFn, required this.decreaseFn, required this.resetFn});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
          onPressed: () => increaseFn(),
          child: const Icon(
              Icons.plus_one_outlined,
              size: 30
          ),
        ),
        FloatingActionButton(
          onPressed: () => resetFn(),
          child: const Icon(
              Icons.lock_reset,
              size: 30
          ),
        ),
        FloatingActionButton(
          onPressed: () => decreaseFn(),
          child: const Icon(
              Icons.exposure_minus_1_outlined,
              size: 30
          ),
        ),
      ],
    );
  }

}