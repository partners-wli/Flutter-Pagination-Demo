import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/ui/product_screen.dart';

import 'core/bloc/products_bloc.dart';

/// Entry point of application
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ProductsBloc())],
      child: MaterialApp(
        title: 'Pagination Example with Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const ProductScreen(),
      ),
    );
  }
}
