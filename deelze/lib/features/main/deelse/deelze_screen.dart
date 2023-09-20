import 'package:deelze/core/presentation/widgets/vaucher_list_item_widget.dart';
import 'package:deelze/features/main/home/widgets/greating_section.dart';
import 'package:flutter/material.dart';

class DeelzeScreen extends StatelessWidget {
  const DeelzeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const GreatingSection(
              image: "assets/images/logo.png",
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
                  child: VaucherListItemWidget(
                    title: '25% off on breakfast items',
                    vaucher: 'Bab Ali restaurant',
                    image: "assets/images/qr_code.png",
                    price: '190 EGP',
                    favouriteButtonVisibile: false,
                    hasQrCode: true,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
