String formatPrice(double price) {
  bool isInteger = price == price.toInt();

  String intPart = price.toInt().abs().toString();
  String sign = price < 0 ? '-' : '';

  String formattedIntPart = '';
  int len = intPart.length;
  for (int i = 0; i < len; i++) {
    if (i > 0 && (len - i) % 3 == 0) {
      formattedIntPart += ' ';
    }
    formattedIntPart += intPart[i];
  }

  if (isInteger) {
    return '$sign$formattedIntPart';
  } else {
    String fullStr = price.toString();
    String decPart = fullStr.split('.').length > 1 ? fullStr.split('.')[1] : '';
    while (decPart.isNotEmpty && decPart.endsWith('0')) {
      decPart = decPart.substring(0, decPart.length - 1);
    }
    return '$sign$formattedIntPart.$decPart';
  }
}