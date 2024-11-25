// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:calci/controller/calci_contr.dart';
import 'package:calci/utils/widgets/coomon_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    final CalculatorController controller = Get.put(CalculatorController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(20),
                child: Obx(() => Text(
                      controller.display.value,
                      style: const TextStyle(fontSize: 80, color: Colors.white),
                      maxLines: 1,
                    )),
              ),
            ),
           
            Column(
              children: [
                _buildButtonRow([
                  'AC',
                  '±',
                  '%',
                  '÷'
                ], colors: [
                  Colors.grey,
                  Colors.grey,
                  Colors.grey,
                  Colors.orange
                ]),
                _buildButtonRow([
                  '7',
                  '8',
                  '9',
                  '×'
                ], colors: [
                  const Color.fromARGB(111, 71, 69, 69),
                  const Color.fromARGB(111, 71, 69, 69),
                  const Color.fromARGB(111, 71, 69, 69),
                  Colors.orange
                ]),
                _buildButtonRow([
                  '4',
                  '5',
                  '6',
                  '-'
                ], colors: [
                  const Color.fromARGB(111, 71, 69, 69),
                  const Color.fromARGB(111, 71, 69, 69),
                  const Color.fromARGB(111, 71, 69, 69),
                  Colors.orange
                ]),
                _buildButtonRow([
                  '1',
                  '2',
                  '3',
                  '+'
                ], colors: [
                  const Color.fromARGB(111, 71, 69, 69),
                  const Color.fromARGB(111, 71, 69, 69),
                  const Color.fromARGB(111, 71, 69, 69),
                  Colors.orange
                ]),
                _buildButtonRow([
                  '',
                  '0',
                  '.',
                  '='
                ], colors: [
                  const Color.fromARGB(111, 71, 69, 69),
                  const Color.fromARGB(111, 71, 69, 69),
                  const Color.fromARGB(111, 71, 69, 69),
                  Colors.orange
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<String?> labels,
      {bool isLastRow = false, List<Color>? colors}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: labels.map((label) {
        if (label == null) return const Expanded(child: SizedBox());
        return CalculatorButton(
          label: label,
          onPressed: () => _onButtonPressed(label),
          color:
              colors?.elementAt(labels.indexOf(label)) ?? Colors.grey.shade800,
          isWide: isLastRow && label == '0',
        );
      }).toList(),
    );
  }

  void _onButtonPressed(String label) {
    final CalculatorController controller = Get.put(CalculatorController());

    if (label == 'AC')
      controller.clear();
    else if (label == '±')
      controller.toggleSign();
    else if (label == '%')
      controller.percentage();
    else if ('÷×+-'.contains(label))
      controller.inputOperator(label);
    else if (label == '=')
      controller.calculate();
    else
      controller.input(label);
  }
}
