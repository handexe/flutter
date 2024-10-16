import 'package:flutter/material.dart';

import 'contact.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  List<Contact> contacts = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Kişi Listesi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: "Kişi Adı"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: "Kişi Numarası",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      String name1 = name.text.trim();
                      String number1 = number.text.trim();

                      if (name1.isNotEmpty && number1.isNotEmpty) {
                        setState(() {
                          name.text = "";
                          number.text = "";
                          contacts.add(Contact(name: name1, contact: number1));
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.purple[200]),
                    child: const Text("Kaydet")),
                ElevatedButton(
                    onPressed: () {
                      String name1 = name.text.trim();
                      String number1 = number.text.trim();
                      if (name1.isNotEmpty && number1.isNotEmpty) {
                        setState(() {
                          name.text = "";
                          number.text = "";
                          var selected = -1;
                          contacts[selected].name= name1;
                          contacts[selected].contact= number1;
                          selected = -1 ;
                        });
                      }

                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.purple[200]),
                    child: const Text("Güncelle"))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if (contacts.isEmpty)
              const Text("veri yok", style: TextStyle(color: Colors.white))
            else
              Expanded(
                  child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (BuildContext context, int index) =>
                          getRow(index)))
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
        child: ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  index % 2 == 0 ? Colors.deepPurple[300] : Colors.purple,
              foregroundColor: Colors.white,
              child: Text(
                contacts[index].name[0],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contacts[index].name , style: const TextStyle(fontWeight: FontWeight.bold),),
                Text(contacts[index].contact)
              ],
            ),
            trailing: SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap:((){
                      name.text = contacts[index].name;
                      number.text = contacts[index].contact;
                    }),
                    child: const Icon(Icons.edit)
                  ),
                  InkWell(
                    onTap:(() {
                      setState(() {
                        contacts.removeAt(index);
                      });
                    }),
                    child: const Icon(Icons.delete)
                  )
                ],
              ),

        ),
        )
    );
  }
}
