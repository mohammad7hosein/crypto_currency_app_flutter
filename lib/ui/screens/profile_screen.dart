import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/my_theme.dart';
import '../components/my_divider.dart';
import '../components/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(context),
            buildAccountBanner(),
            buildMenu(context),
          ],
        ),
      ),
    );
  }

  Expanded buildMenu(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: veryLight,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const ProfileMenuItem(
                text: "Bank Account",
                icon: Icons.credit_card_rounded,
                color: Colors.pink,
              ),
              MyDivider(color: Colors.grey[300]!, margin: 30),
              ProfileMenuItem(
                text: "Preferences",
                icon: Icons.settings_rounded,
                color: Colors.amber[400]!,
              ),
              MyDivider(color: Colors.grey[300]!, margin: 30),
              const ProfileMenuItem(
                text: "Account Security",
                icon: Icons.lock_outline_rounded,
                color: purpleLight,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25, left: 80, right: 100),
                height: 7,
                decoration: BoxDecoration(
                  color: purpleVeryLight,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  margin: const EdgeInsets.only(right: 100),
                  height: 7,
                  decoration: BoxDecoration(
                    color: purpleLight,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              MyDivider(color: Colors.grey[300]!, margin: 30),
              const ProfileMenuItem(
                text: "Log out",
                icon: Icons.logout_rounded,
                color: Colors.green,
              ),
              MyDivider(color: Colors.grey[300]!, margin: 30),
            ],
          ),
        ),
      ),
    );
  }

  Stack buildAccountBanner() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.pink.withOpacity(0.35),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mohammad Hosein",
                style: GoogleFonts.ubuntu(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "mohammad77hosein77@gmail.com",
                style: GoogleFonts.ubuntu(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            alignment: Alignment.bottomRight,
            "assets/images/user_account.png",
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
        ),
      ],
    );
  }

  Padding buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: Row(
        children: [
          Text(
            "Account",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
