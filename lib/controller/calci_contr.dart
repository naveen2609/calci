import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var display = '0'.obs;
  var operator = ''.obs;
  var firstOperand = ''.obs;
  var secondOperand = ''.obs;
  var isSecondOperand = false.obs;

  void input(String value) {
    if (isSecondOperand.value) {
      secondOperand.value += value;
      display.value = secondOperand.value;
    } else {
      firstOperand.value += value;
      display.value = firstOperand.value;
    }
  }

  void inputOperator(String newoperator) {
    if (firstOperand.value.isNotEmpty) {
      operator.value = newoperator;
      isSecondOperand.value = true;
    }
  }

  void calculate() {
    if (firstOperand.isEmpty || secondOperand.isEmpty || operator.isEmpty) return;

    double num1 = double.parse(firstOperand.value);
    double num2 = double.parse(secondOperand.value);
    double result;

    switch (operator.value) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '×':
        result = num1 * num2;
        break;
      case '÷':
        result = num2 != 0 ? num1 / num2 : double.nan;
        break;
      default:
        result = 0;
    }

    display.value = result.toPrecision(2).toString();
    _resetAfterCalculation();
  }

  void clear() {
    display.value = '0';
    firstOperand.value = '';
    secondOperand.value = '';
    operator.value = '';
    isSecondOperand.value = false;
  }

  void toggleSign() {
    if (isSecondOperand.value) {
      secondOperand.value = (-double.parse(secondOperand.value)).toString();
      display.value = secondOperand.value;
    } else {
      firstOperand.value = (-double.parse(firstOperand.value)).toString();
      display.value = firstOperand.value;
    }
  }

  void percentage() {
    if (isSecondOperand.value) {
      secondOperand.value = (double.parse(secondOperand.value) / 100).toString();
      display.value = secondOperand.value;
    } else {
      firstOperand.value = (double.parse(firstOperand.value) / 100).toString();
      display.value = firstOperand.value;
    }
  }

  void _resetAfterCalculation() {
    firstOperand.value = display.value;
    secondOperand.value = '';
    operator.value = '';
    isSecondOperand.value = false;
  }
}
