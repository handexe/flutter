import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController firstET = TextEditingController();
  final TextEditingController secondET = TextEditingController();
  double sayi = 0;
  @override
  void dispose() {
    firstET.dispose();
    super.dispose();
  }
  @override
  void dispose2() {
    secondET.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Hesap Makinesi"),
      ),
      body: Container(
          padding: const EdgeInsets.all(30),
          color: Colors.purple[100],
          child: Column(
            children: [
              TextField(
                controller: firstET,keyboardType: TextInputType.number,

                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Sayı Giriniz: ",
                ),

              ),
              const SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.number,
                controller: secondET,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Sayı Giriniz: ",
                ),

              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 80, //height of button
                    width: 80, //width of button

                    child: ElevatedButton(
                      onPressed: () {
                        double a = double.parse(firstET.text);
                        double b = double.parse(secondET.text);
                        setState(() {
                          sayi = a+b ;
                        });

                      },
                      child: const Text("+", style: TextStyle(fontSize: 80)),
                    ),
                  ),
                  SizedBox(
                      height: 80, //height of button
                      width: 80, //width of button

                      child: ElevatedButton(
                        onPressed: () {
                          double a = double.parse(firstET.text);
                          double b = double.parse(secondET.text);
                         setState(() {
                           sayi = a-b ;
                         });
                        },
                        child: const Text("-", style: TextStyle(fontSize: 80)),
                      ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 80, //height of button
                    width: 80, //width of button

                    child: ElevatedButton(
                      onPressed: () {
                        double a = double.parse(firstET.text);
                        double b = double.parse(secondET.text);
                        setState(() {
                          sayi = a*b ;
                        });
                      },
                      child: const Text("*", style: TextStyle(fontSize: 80)),
                    ),
                  ),
                  SizedBox(
                      height: 80, //height of button
                      width: 80, //width of button

                      child: ElevatedButton(
                        onPressed: () {
                          double a = double.parse(firstET.text);
                          double b = double.parse(secondET.text);
                         setState(() {
                           sayi = a/b ;
                         });
                        },
                        child: const Text("/", style: TextStyle(fontSize: 80)),
                      ))
                ],
              ),
              const SizedBox(height: 30),

              Text(

                "Sonuç = ${sayi.toString()}" , style: const TextStyle(
                fontSize: 40
              ),)
            ],
          )),
    );
  }


}
