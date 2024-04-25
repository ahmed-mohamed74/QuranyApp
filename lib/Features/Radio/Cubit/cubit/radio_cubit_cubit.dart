import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../radio_repostory_implementations.dart';
import '../../radio_webservices.dart';

part 'radio_cubit_state.dart';

class RadioCubitCubit extends Cubit<RadioCubitState> {
  RadioCubitCubit(this.radioRepostoryImpl) : super(RadioCubitInitial());

  final RadioRepostoryImpl radioRepostoryImpl;

  Future<void> getAllRadioStations() async {
    try {
      emit(RadioCubitLoading());
      final quranRadios = await radioRepostoryImpl.getAllRadioStations();
      emit(RadioCubitSuccess(radiosData: quranRadios));
    } catch (e) {
      emit(RadioCubitFailure(errorMessage: e.toString()));
    }
  }
}

class RotatedCircle extends StatefulWidget {
  const RotatedCircle({super.key});

  @override
  RotatedCircleState createState() => RotatedCircleState();
}

class RotatedCircleState extends State<RotatedCircle> {
  double rotationAngle = 0;
  // Initial rotation angle

  @override
  void initState() {
    super.initState();
    // Start rotating the circle
    startRotation();
  }

  void startRotation() {
    // Rotate the circle continuously
    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        rotationAngle += 0.01; // Adjust the rotation speed as needed
        startRotation(); // Continue rotating
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Rotating Circle with Background Image'),
        ),
        body: Center(
          child: AnimatedBuilder(
            animation:
                Listenable.merge([/* Add any other relevant animations */]),
            builder: (context, child) {
              return Transform.rotate(
                angle: rotationAngle,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://i1.sndcdn.com/artworks-000019055020-yr9cjc-t200x200.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
