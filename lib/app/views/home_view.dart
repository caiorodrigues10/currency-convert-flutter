import 'package:conversor/app/components/currency_box.dart';
import 'package:conversor/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText, fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 100),
          child: Column(
            children: [
              Image.network(
                'https://img.icons8.com/pulsar-color/48/currency-exchange.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 10,
              ),
              CurrencyBox(
                  controller: toText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model;
                    });
                  },
                  selectedItem: homeController.toCurrency),
              SizedBox(
                height: 10,
              ),
              CurrencyBox(
                  controller: fromText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model;
                    });
                  },
                  selectedItem: homeController.fromCurrency),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  homeController.convert();
                },
                child: Text(
                  'CONVERTER',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
