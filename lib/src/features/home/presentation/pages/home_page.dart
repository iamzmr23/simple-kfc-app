import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfc/src/features/home/presentation/widgets/wappbar.dart';
import 'package:kfc/src/features/home/presentation/widgets/wdrawer.dart';
import 'package:kfc/src/features/home/presentation/widgets/wgridview_products.dart';
import 'package:kfc/src/features/home/presentation/widgets/wlistview_products.dart';
import 'package:kfc/src/features/home/presentation/widgets/wprice_order.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBar(
        onCartPressed: () {
          showModalBottomSheet(
            builder: (BuildContext context) {
              return const Padding(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: WshowModalBottomSheet(),
              );
            },
            context: context,
          );
        },
      ),
      drawer: const WDrawer(),
      body: const WGridviewProducts(),
    );
  }
}

class WshowModalBottomSheet extends ConsumerWidget {
  const WshowModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        WlistViewProducts(),
        WPriceandOrder(),
      ],
    );
  }
}
