import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_runner/cubit/price_runner_cubit.dart';
import 'package:price_runner/data/price_model.dart';

class PriceRunnerScreen extends StatefulWidget {
  const PriceRunnerScreen({Key? key}) : super(key: key);

  @override
  State<PriceRunnerScreen> createState() => _PriceRunnerScreenState();
}

class _PriceRunnerScreenState extends State<PriceRunnerScreen> {
  final amazonBrand = 'Amazon EG';
  final jumiaBrand = 'Jumia Egypt';
  final dubaiPhoneBrand = 'Dubai Phone';
  final amazonLogo = 'assets/images/logos/amazon.png';
  final jumiaLogo = 'assets/images/logos/amazon.png';
  final dubaiPhoneLogo = 'assets/images/logos/amazon.png';
  Size? screenSize;
  PriceRunnerCubit? priceRunnerCubit;
  final inStockIcon = 'assets/images/icons/In_stock.png';
  final outStockIcon = 'assets/images/icons/Out_of_stock.png';
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    priceRunnerCubit = PriceRunnerCubit.getInstance(context);
    return BlocBuilder<PriceRunnerCubit,PriceRunnerState>(
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: state is PriceRunnerInitial || state is PriceRunnerLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'PriceRunner',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: screenSize!.height * 0.05),
                      child: Image.network(
                        priceRunnerCubit!.product!.image,
                        fit: BoxFit.contain,
                        height: screenSize!.height * 0.2,
                        width: screenSize!.width * 0.5,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          priceRunnerCubit!.product!.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: priceRunnerCubit!.product!.name
                              .split(' ')
                              .map((keyword) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color(0xFFF5F6F5),
                                        ),
                                        child: Text(
                                          keyword,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!
                                              .copyWith(
                                                  color: const Color(
                                                      0xFF888888)),
                                        )),
                                  ))
                              .toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Discover & compare prices',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: PriceRunnerCubit().displayedPrices.map((price) => _buildItem(price)).toList(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    TextButton.icon(
                        onPressed: () {
                          priceRunnerCubit!.lengthOfDisplayedPrices <
                                  priceRunnerCubit!.prices.length
                              ? priceRunnerCubit!.showMorePrices()
                              : priceRunnerCubit!.showLessPrices();
                        },
                        icon: Text(
                          priceRunnerCubit!.lengthOfDisplayedPrices <
                                  priceRunnerCubit!.prices.length
                              ? 'show More prices'
                              : 'show Less prices',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        label: priceRunnerCubit!.lengthOfDisplayedPrices <
                                priceRunnerCubit!.prices.length
                            ? const Icon(Icons.arrow_drop_down_sharp)
                            : const Icon(Icons.arrow_drop_up_sharp))
                  ],
                ),
        )),
      ),
    );
  }

  Widget _buildItem(Price price) => Row(
        children: [
          Container(
            width: screenSize!.width * 0.1,
            height: screenSize!.width * 0.1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: const Color(0xFFE8E8E8))),
            child: Image.asset(
              price.brand == amazonBrand
                  ? amazonLogo
                  : (price.brand == jumiaBrand)
                      ? jumiaLogo
                      : dubaiPhoneLogo,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            price.brand,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 5,
          ),
          Image.asset(
            price.inStock ? inStockIcon : outStockIcon,
            width: screenSize!.width * 0.05,
            height: screenSize!.width * 0.05,
          ),
          const Spacer(),
          Text(
            price.price,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w700),
          )
        ],
      );
}
