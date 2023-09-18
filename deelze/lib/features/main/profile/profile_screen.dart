import 'package:deelze/features/main/profile/widgets/edit_email_dialog_view.dart';
import 'package:deelze/navigation/router_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(7, 106, 127, 1),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(239, 239, 239, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  FittedBox(
                    child: Row(
                      children: [
                        Text(
                          'Muhammed',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                fontSize: 23,
                                fontWeight: FontWeight.w800,
                                color: const Color.fromRGBO(131, 131, 131, 1),
                              ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showCupertinoDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  EditEmailDialogView(
                                hintText: "Name",
                                text: "Edit Name",
                                onCancel: () {
                                  context.pop();
                                },
                                onConfirm: () {
                                  context.pop();
                                  // context.read<AuthBloc>().add(AuthEvent.signOut());
                                },
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.edit_outlined,
                            color: Color.fromRGBO(7, 106, 127, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      'Good morning',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 18,
                            color: const Color.fromRGBO(131, 131, 131, 1),
                          ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(21),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            const SizedBox(width: 8),
                            Image.asset(
                              'assets/images/adress_icon.png',
                              color: Colors.black,
                            ),
                            const Text(
                              "Adress",
                              style: TextStyle(
                                fontFamily: 'Nutrio',
                                color: Color.fromRGBO(131, 131, 131, 1),
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    "Adress",
                                    style: TextStyle(
                                      fontFamily: 'Nutrio',
                                      color: Color.fromRGBO(131, 131, 131, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                showCupertinoDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      EditEmailDialogView(
                                    hintText: "Adress",
                                    text: "Edit Adress",
                                    onCancel: () {
                                      context.pop();
                                    },
                                    onConfirm: () {
                                      context.pop();
                                      // context.read<AuthBloc>().add(AuthEvent.signOut());
                                    },
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.edit_outlined,
                                color: Color.fromRGBO(7, 106, 127, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(21),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            const SizedBox(width: 8),
                            Image.asset(
                              'assets/images/email_icon.png',
                              color: Colors.black,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              "Email",
                              style: TextStyle(
                                fontFamily: 'Nutrio',
                                color: Color.fromRGBO(131, 131, 131, 1),
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    "Muhammed45_90@gmail.com",
                                    style: TextStyle(
                                      fontFamily: 'Nutrio',
                                      color: Color.fromRGBO(131, 131, 131, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                showCupertinoDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      EditEmailDialogView(
                                    hintText: "Email",
                                    text: "Edit Email",
                                    onCancel: () {
                                      context.pop();
                                    },
                                    onConfirm: () {
                                      context.pop();
                                      // context.read<AuthBloc>().add(AuthEvent.signOut());
                                    },
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.edit_outlined,
                                color: Color.fromRGBO(7, 106, 127, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(21),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/mobile_number_icon.png',
                              color: Colors.black,
                            ),
                            const Text(
                              "Mobile Number",
                              style: TextStyle(
                                fontFamily: 'Nutrio',
                                color: Color.fromRGBO(131, 131, 131, 1),
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    "+201012345678",
                                    style: TextStyle(
                                      fontFamily: 'Nutrio',
                                      color: Color.fromRGBO(131, 131, 131, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                showCupertinoDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      EditEmailDialogView(
                                    hintText: "Mobile number",
                                    text: "Edit Mobile number",
                                    onCancel: () {
                                      context.pop();
                                    },
                                    onConfirm: () {
                                      context.pop();
                                      // context.read<AuthBloc>().add(AuthEvent.signOut());
                                    },
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.edit_outlined,
                                color: Color.fromRGBO(7, 106, 127, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(21),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: () {
                            context.push(
                                "${RoutePaths.authWrapper}/${RoutePaths.orderHistory}");
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.history),
                              SizedBox(width: 8.0),
                              Text(
                                "History",
                                style: TextStyle(
                                  fontFamily: 'Nutrio',
                                  color: Color.fromRGBO(131, 131, 131, 1),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: (MediaQuery.of(context).size.height / 1.5) - 60,
            child: GestureDetector(
              onTap: () {
                print('Edit avatar');
              },
              child: const Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/food.png'),
                  ),
                  Positioned(
                    child: Icon(
                      Icons.edit_outlined,
                      color: Color.fromRGBO(7, 106, 127, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.1,
            child: Text(
              'Profile',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
