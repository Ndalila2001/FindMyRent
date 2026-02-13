import 'package:flutter/material.dart';

class Listingslargeview extends StatefulWidget {
  const Listingslargeview({super.key});

  @override
  State<Listingslargeview> createState() => _ListingslargeviewState();
}

class _ListingslargeviewState extends State<Listingslargeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: SafeArea(
        child: Center(
          child: Text(
            "Listings Large View",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
