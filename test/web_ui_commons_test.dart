import 'package:flutter_test/flutter_test.dart';

import '../lib/web_ui_commons.dart';

void main() {
  test('adds one to input values', () {
   
    // expect(calculator.addOne(2), 3);
    // expect(calculator.addOne(-7), -6);
    // expect(calculator.addOne(0), 1);

    final utils = Utils();
    expect(utils.capitalize("mutter"), "Mutter");
  });
}
