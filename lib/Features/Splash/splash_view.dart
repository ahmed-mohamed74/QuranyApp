import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../app_router.dart';
import '../../core/global/SharedWidgets/image_with_aspect_ratio.dart';
import '../../core/global/image_assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(
        seconds: 3,
      ),
      () => Navigator.of(context).pushReplacementNamed(AppRouter.homeScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ImageWithAspectRatio(
              image: Assets.imagesSplashScreen,
              aspectRatio: 1 / 1,
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class AnimatedLottie extends StatefulWidget {
  const AnimatedLottie({super.key});

  @override
  State<AnimatedLottie> createState() => _AnimatedLottieState();
}

class _AnimatedLottieState extends State<AnimatedLottie>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Durations.extralong3, //*Duration for the animation
      // reverseDuration:
      //     Durations.extralong3, //*Duration of reseting time for the animation
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Lottie.asset(
              "assets/Animations/confetti_animation.json",
              fit: BoxFit.cover,

              width: 800,
              alignment: Alignment.topCenter,
              reverse: true,

              controller: _animationController,
              renderCache: RenderCache
                  .drawingCommands, //! see and decide later whether RenderCache.drawingCommands or RenderCache.raster
              //special render mode where the frames of the animation are lazily rendered
              //and kept in a cache.
              //Subsequent runs of the animation are cheaper to render.
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //* to make the animation start by clicking by using constroller
          //! but if we make this only it would be run only after one click only and widget will be disposed
          //* in order to deal with that call whenComplete and reset controller
          // _animationController.forward()

          _animationController.forward().whenComplete(
                () => _animationController.reset(),
              );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
