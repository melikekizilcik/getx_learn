import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SayacController extends GetxController {
  var _sayac = 0.obs;
  //var _liste = [].obs;

  /*
  //değişkenin ilk değer ataması yapmak için onInıt kullanıyoruz:
  @override
  void onInit() {
    super.onInit();
    _sayac = 0.obs;

    //obs: sayac değeri değişecek ve sayac'ın değerinin değişmesiyle arayüz de değişecek anlamına gelir
  } */

  /*
  obs olduğu için sayac değerini direkt alamıyoruz ve getter setter kullanıyoruz:
  int sayacDegeriVer() {
    return _sayac.value;
  }
  aşağıdaki tek satırlık get kodu ile yukarıdaki sayacDegeriVer fonksiyonunun hiçbir farkı yok, aynı
  */

  get sayac => _sayac.value;

  //yeni değeri alıp sayac'a atıyoruz:
  set sayac(yeniDeger) => _sayac.value = yeniDeger;

  void arttir() {
    sayac++;
    Get.snackbar("Snackbar", "Mesaj", backgroundColor: Colors.teal);
  }

  void azalt() {
    sayac--;
    Get.snackbar(
      "Snackbar",
      "Mesaj",
      duration: Duration(seconds: 4),
      isDismissible: true,
    );
  }
}
