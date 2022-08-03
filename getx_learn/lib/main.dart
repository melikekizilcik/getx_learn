import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_learn/ceviri.dart';
import 'package:getx_learn/sayac_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Getx ile navigation, snackbar özelliklerini kullanmak için materialApp'i GetMaterialApp ile değiştirmemiz lazım
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Messages(), // your translations
      locale: Get.deviceLocale, // translations will be displayed in that locale
      fallbackLocale: Locale('en',
          'UK'), // specify the fallback locale in case an invalid locale is selected.
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  //SayacController'dan nesne ürettik ve get.put ile bunu bütün widget tree'de kullanabileceğiz (obx buna ihtiyaç duyar)
  SayacController _controller = Get.put(SayacController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: myColumn()),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          heroTag: "1",
          onPressed: () {
            _controller.arttir();
            print(_controller.sayac);
          },
          child: Icon(Icons.add),
        ),
        FloatingActionButton(
          heroTag: "2",
          onPressed: () {
            _controller.azalt();
            print(_controller.sayac);
          },
          child: Icon(Icons.remove),
        ),
        FloatingActionButton(
          heroTag: "3",
          foregroundColor: Get.isDarkMode ? Colors.yellowAccent : Colors.red,
          onPressed: () {
            //uygulama temasını değiştirme
            Get.changeTheme(
                Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
          },
          child: Icon(Icons.change_circle),
        ),
        FloatingActionButton(
            heroTag: "4",
            onPressed: () {
              //Navigation kullanımı (Yeni bir sayfaya geçme):
              Get.to(NewPage());
              //Get.off(NewPage()) yazarsak NewPage'e gittiği zaman bu sayfa state'ten çıkarılacak
            },
            child: Icon(Icons.navigate_next_rounded)),
        FloatingActionButton(
            heroTag: "5",
            onPressed: () {
              Get.updateLocale(Get.locale == Locale("tr", "TR")
                      ? Locale("en", "US")
                      : Locale("tr", "TR")
                  //Eğer dil türkçe ise ingilizceye çevir, eğer türkçe değilse türkçeye çevir
                  );
            },
            child: Icon(Icons.abc_rounded))
      ]),
    );
  }

  Column myColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "hello".tr,
          style: TextStyle(fontSize: 32),
        ),
        Text(
          "button_text".tr,
          style: TextStyle(fontSize: 32),
        ),
        //değer okuma yapan dinleyen bir widget'a ihtiyacımız var:
        //getX sadece <> kısımdaki veriye ihtiyaç duyar nesne oluşturulmasına ihtiyaç duymaz (obx nesneye ihtiyaç duyar)
        GetX<SayacController>(
            builder: ((controller2) => Text(
                  controller2.sayac.toString(),
                  style: TextStyle(fontSize: 32),
                )))
      ],
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Text("Yeni Sayfa"),
          ElevatedButton(
            onPressed: () {
              //Bir önceki sayfaya geri dönebilmek için:
              Get.back();
            },
            child: Text("Geri dön"),
          ),
        ],
      ),
    ));
  }
}
