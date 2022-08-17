import 'package:cripto_currency_app_flutter/providers/login_screen_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants/my_theme.dart';
import '../components/my_divider.dart';
import '../components/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(theme),
            buildAccountBanner(),
            buildMenu(context, theme),
          ],
        ),
      ),
    );
  }

  Expanded buildMenu(BuildContext context, ThemeData theme) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              ProfileMenuItem(
                text: "Bank Account",
                icon: Icons.credit_card_rounded,
                color: Colors.pink,
                onPressed: () {},
              ),
              MyDivider(color: theme.dividerColor, margin: 30),
              ProfileMenuItem(
                text: "Preferences",
                icon: Icons.settings_rounded,
                color: Colors.amber[400]!,
                onPressed: () {},
              ),
              MyDivider(color: theme.dividerColor, margin: 30),
              ProfileMenuItem(
                text: "Account Security",
                icon: Icons.lock_outline_rounded,
                color: purpleLight,
                onPressed: () {},
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
                    color: theme.primaryColorLight,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              MyDivider(color: theme.dividerColor, margin: 30),
              ProfileMenuItem(
                text: "Log out",
                icon: Icons.logout_rounded,
                color: Colors.green,
                onPressed: () {
                  context.read<LoginScreenProvider>().logout();
                },
              ),
              MyDivider(color: theme.dividerColor, margin: 30),
            ],
          ),
        ),
      ),
    );
  }

  Stack buildAccountBanner() {
    final user = FirebaseAuth.instance.currentUser!;
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
                user.displayName ?? "Username",
                style: GoogleFonts.ubuntu(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                user.email!,
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

  Padding buildAppBar(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: Row(
        children: [
          Text(
            "Account",
            style: theme.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
