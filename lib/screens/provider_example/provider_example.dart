import 'package:flutter/material.dart';
import 'package:nbu_api/screens/get_x_example/get_x_example.dart';
import 'package:nbu_api/screens/widgets/currency_item.dart';
import 'package:nbu_api/state_management/view_model/currency_view_model.dart';
import 'package:provider/provider.dart';

class ProviderExample extends StatelessWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const GetXExample();
                  },
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
        centerTitle: true,
        title: const Text("Provider Example"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => CurrencyViewModel(),
        child: Consumer<CurrencyViewModel>(
          builder: (context, currencyViewModel, child) {
            return currencyViewModel.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : currencyViewModel.errorText.isEmpty
                    ? CustomScrollView(
                        slivers: [
                          SliverPadding(
                            padding: const EdgeInsets.only(bottom: 16),
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => CurrencyWidget(
                                  currency:
                                      currencyViewModel.currencyData[index],
                                ),
                                childCount:
                                    currencyViewModel.currencyData.length,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            currencyViewModel.errorText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
          },
        ),
      ),
    );
  }
}
