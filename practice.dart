// Synchronous
// String createOrderMessage() {
//   var order = getUserOrder();
//   return 'Your order is: $order';
// }

// Future<String> getUserOrder() {
//   return Future.delayed(Duration(seconds: 4), () => 'Large Latte');
// }

// main() {
//   print('Fetching user order ...');
//   print(createOrderMessage());
// }

// result
//Fetching user order ...
//Your order is: Instance of 'Future<String>'

// Asynchronous
Future<String> createOrderMessage() async {
  var order = await getUserOrder();
  return 'Your order is: $order';
}

Future<String> getUserOrder() {
  return Future.delayed(Duration(seconds: 4), () => 'Large Latte');
}

main() async {
  print('Fetching user order ...');
  print(await createOrderMessage());
}
