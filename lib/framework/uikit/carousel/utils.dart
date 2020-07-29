int remainder(int input, int source) {
  if (source == 0) return 0;
  final int result = input % source;
  return result < 0 ? source + result : result;
}

int getRealIndex(int position, int base, int length) {
  final int offset = position - base;
  return remainder(offset, length);
}