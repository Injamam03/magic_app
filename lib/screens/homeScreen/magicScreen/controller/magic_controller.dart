import 'package:get/get.dart';
import 'package:magic_app/routes/app_routes.dart';

class MagicController extends GetxController {
  // ছবি থেকে নেওয়া ৬টি কার্ডের সংখ্যা
  final List<List<int>> cards = [
    [
      4,
      5,
      6,
      7,
      12,
      13,
      14,
      15,
      20,
      21,
      22,
      23,
      28,
      29,
      30,
      31,
      36,
      37,
      38,
      39,
      44,
      45,
      46,
      47,
      52,
      53,
      54,
      55,
      60,
    ],
    [
      2,
      3,
      6,
      7,
      10,
      11,
      14,
      15,
      18,
      19,
      22,
      23,
      26,
      27,
      30,
      31,
      34,
      35,
      38,
      39,
      42,
      43,
      46,
      47,
      50,
      51,
      54,
      55,
      58,
      59,
    ],
    [
      1,
      3,
      5,
      7,
      9,
      11,
      13,
      15,
      17,
      19,
      21,
      23,
      25,
      27,
      29,
      31,
      33,
      35,
      37,
      39,
      41,
      43,
      45,
      47,
      49,
      51,
      53,
      55,
      57,
      59,
    ],
    [
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      24,
      25,
      26,
      27,
      28,
      29,
      30,
      31,
      40,
      41,
      42,
      43,
      44,
      45,
      46,
      47,
      56,
      57,
      58,
      59,
      60,
    ],
    [
      32,
      33,
      34,
      35,
      36,
      37,
      38,
      39,
      40,
      41,
      42,
      43,
      44,
      45,
      46,
      47,
      48,
      49,
      50,
      51,
      52,
      53,
      54,
      55,
      56,
      57,
      58,
      59,
      60,
    ],
    [
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
      25,
      26,
      27,
      28,
      29,
      30,
      31,
      48,
      49,
      50,
      51,
      52,
      53,
      54,
      55,
      56,
      57,
      58,
      59,
      60,
    ],
  ];

  // প্রতিটি কার্ডের first number (magic এর রহস্য এখানেই)
  List<int> get firstNumbers => cards.map((c) => c.first).toList();

  final RxInt currentCardIndex = 0.obs;
  final RxList<int> yesCardFirstNumbers = <int>[].obs;
  final RxInt guessedNumber = 0.obs;

  void onYes() {
    yesCardFirstNumbers.add(firstNumbers[currentCardIndex.value]);
    _next();
  }

  void onNo() {
    _next();
  }

  void _next() {
    if (currentCardIndex.value < cards.length - 1) {
      currentCardIndex.value++;
    } else {
      // সব yes card এর first number যোগ করলেই গুপ্ত সংখ্যা পাওয়া যাবে
      guessedNumber.value = yesCardFirstNumbers.fold(0, (a, b) => a + b);
      Get.toNamed(AppRoutes.magicResultScreen);
    }
  }

  void restart() {
    currentCardIndex.value = 0;
    yesCardFirstNumbers.clear();
    guessedNumber.value = 0;
    Get.offAllNamed(AppRoutes.magicIntroScreen);
  }

  List<int> get currentCard => cards[currentCardIndex.value];
}
