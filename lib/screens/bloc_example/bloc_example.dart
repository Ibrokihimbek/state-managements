import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nbu_api/screens/provider_example/provider_example.dart';
import 'package:nbu_api/screens/widgets/currency_item.dart';
import 'package:nbu_api/state_management/bloc/currency_bloc.dart';

class BlocExample extends StatelessWidget {
  const BlocExample({super.key});

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
                    return const ProviderExample();
                  },
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
        centerTitle: true,
        title: const Text("Flutter Bloc Example"),
      ),
      body: BlocProvider(
        create: (context) =>
            CurrencyBloc()..add(const CurrencyEventGetAllCurrency()),
        child: BlocBuilder<CurrencyBloc, CurrencyState>(
          builder: (context, state) {
            return state.status.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.status.isSuccess
                    ? CustomScrollView(
                        slivers: [
                          SliverPadding(
                            padding: const EdgeInsets.only(bottom: 16),
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => CurrencyWidget(
                                  currency: state.currencyList[index],
                                ),
                                childCount: state.currencyList.length,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            state.errorText,
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
