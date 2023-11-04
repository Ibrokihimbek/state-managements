import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbu_api/screens/widgets/currency_item.dart';
import 'package:nbu_api/state_management/get_x/currency_controller/currency_controller.dart';

class GetXExample extends StatelessWidget {
  const GetXExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
        centerTitle: true,
        title: const Text("GetX Example"),
      ),
      body: GetBuilder<CurrencyController>(
        init: CurrencyController(),
        builder: (ctr) => ctr.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ctr.errorText.isEmpty
                ? CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.only(bottom: 16),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => CurrencyWidget(
                              currency: ctr.currencyList[index],
                            ),
                            childCount: ctr.currencyList.length,
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        ctr.errorText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
