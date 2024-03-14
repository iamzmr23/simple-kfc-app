import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfc/src/features/home/controller/home_controller.dart';

class WAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const WAppBar({super.key, required this.onCartPressed});

  final VoidCallback onCartPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    final con = ref.read(homeController);
    int itemCount = con.products.length;
    return AppBar(
      centerTitle: true,
      title: Image.asset('assets/images/kfc_logo.png', height: 30),
      actions: [
        Stack(
          children: [
            IconButton(onPressed: onCartPressed, icon: const Icon(CupertinoIcons.cart_fill)),
            itemCount != 0
                ? Positioned(
                    left: 30,
                    child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                        child: Center(child: Text(itemCount.toString(), style: const TextStyle(color: Colors.white, fontSize: 12)))))
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
