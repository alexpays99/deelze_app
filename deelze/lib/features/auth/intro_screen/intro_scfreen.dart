import 'package:deelze/navigation/router_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(7, 106, 127, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(7, 106, 127, 1),
      ),
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Instane Deals Personalized for you',
                textAlign: TextAlign.right,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 50),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 5,
              left: -150,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width / 1.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 64,
              child: GestureDetector(
                onTap: () => context.push(
                    "${RoutePaths.authWrapper}/${RoutePaths.signinSignup}"),
                child: Container(
                  width: 243,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(42),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 220,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(239, 239, 239, 100),
                        borderRadius: BorderRadius.circular(42),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Sign in / Sign up',
                            style: TextStyle(
                                color: Color.fromRGBO(7, 106, 127, 1)),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(42),
                            ),
                            child: const Icon(Icons.arrow_outward),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
