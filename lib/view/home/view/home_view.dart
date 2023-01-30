import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel viewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(10)),
              Observer(builder: ((_) => Text(viewModel.value.toString()))),
              TextButton(
                  onPressed: viewModel.increment,
                  child: Container(
                    color: Colors.purple,
                    child: const Text("increment"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
