// ignore_for_file: use_super_parameters
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfc/src/features/home/controller/home_controller.dart';

class WDrawer extends ConsumerWidget {
  const WDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    final con = ref.read(homeController);
    return Drawer(
      backgroundColor: Colors.grey[300],
      elevation: 10,
      shadowColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.6,
      surfaceTintColor: Colors.transparent,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    con.fetchDataFromFirestore('combo');
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Image.asset("assets/images/combo.png", height: 55, width: 45),
                      const Text("Combo", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black)),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    con.fetchDataFromFirestore('lunchboxes');
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Image.asset("assets/images/launchboxes.png", height: 55, width: 45),
                      const Text("Lunchboxes", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black)),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    con.fetchDataFromFirestore('baskets');
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Image.asset("assets/images/baskets.png", height: 55, width: 45),
                      const Text("Baskets", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black)),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    con.fetchDataFromFirestore('burgers');
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Image.asset("assets/images/burgers.png", height: 55, width: 45),
                      const Text("Burgers", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black)),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    con.fetchDataFromFirestore('twisters');
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Image.asset("assets/images/twisters.png", height: 55, width: 45),
                      const Text("Twisters", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black)),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    con.fetchDataFromFirestore('juicychicken');
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Image.asset("assets/images/juicychicken.png", height: 55, width: 45),
                      const Text("Juicy Chicken", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black)),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    con.fetchDataFromFirestore('snacks');
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Image.asset("assets/images/snacks.png", height: 55, width: 45),
                      const Text("Snacks", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black)),
                    ],
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    con.fetchDataFromFirestore('colddrinks');
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Image.asset("assets/images/drinks.png", height: 55, width: 45),
                      const Text("Cold Drinks", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black)),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    con.fetchDataFromFirestore('hotdrinks');
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Image.asset("assets/images/hotdrinks.png", height: 55, width: 45),
                      const Text("Hot Drinks", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black)),
                    ],
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    con.fetchDataFromFirestore('sauces');
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Image.asset("assets/images/sauces.png", height: 55, width: 45),
                      const Text("Sauces", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black)),
                    ],
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    con.fetchDataFromFirestore('desserts');
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Image.asset("assets/images/desserts.png", height: 55, width: 45),
                      const Text("Desserts", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
