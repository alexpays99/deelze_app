import 'package:deelze/navigation/router_paths.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GreatingSection extends StatelessWidget {
  const GreatingSection({
    super.key,
    this.title,
    this.image,
    this.isOfferingHistory = false,
  });
  final String? title;
  final String? image;
  final bool? isOfferingHistory;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width,
      height: title == null ? null : MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(239, 239, 239, 100),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(64),
          bottomRight: Radius.circular(64),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/avatar_placeholder.png'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  if (isOfferingHistory != null)
                    isOfferingHistory!
                        ? Text(
                            'Offers history',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  fontFamily: 'Nunito',
                                  color: const Color.fromRGBO(7, 106, 127, 1),
                                ),
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                child: Text(
                                  'Good morning',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromRGBO(
                                            131, 131, 131, 1),
                                      ),
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  FirebaseAuth
                                          .instance.currentUser?.displayName ??
                                      '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        color: const Color.fromRGBO(
                                            131, 131, 131, 1),
                                      ),
                                ),
                              ),
                            ],
                          ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.push(
                          "${RoutePaths.authWrapper}/${RoutePaths.orderHistory}");
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(239, 239, 239, 100),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(Icons.history),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () {
                      context.push(
                          "${RoutePaths.authWrapper}/${RoutePaths.scanQrCode}");
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(239, 239, 239, 100),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(Icons.qr_code),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              title == null || title == ''
                  ? const SizedBox.shrink()
                  : const SizedBox(height: 32.0),
              Text(
                title ?? '',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: 'Nunito',
                      fontSize: 40,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w900,
                      color: const Color.fromRGBO(7, 106, 127, 1),
                    ),
              ),
              const SizedBox(width: 16),
              image == null
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 32.0),
                      child: Image.asset(image ?? ''),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
