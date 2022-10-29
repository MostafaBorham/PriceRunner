import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_runner/data/http_helper.dart';
import 'package:price_runner/data/price_model.dart';
import 'package:price_runner/data/product_model.dart';

part 'price_runner_state.dart';

class PriceRunnerCubit extends Cubit<PriceRunnerState> {
  PriceRunnerCubit() : super(PriceRunnerInitial());
  Product? product;
  List<Price> prices = [];
  List<Price> displayedPrices = [];
  int lengthOfDisplayedPrices =
      0; //عبارة عن طول القائمة الخاصة بالاسعار المؤقتة الظاهرة حاليا فى الشاشة
  static PriceRunnerCubit getInstance(context) =>
      BlocProvider.of<PriceRunnerCubit>(context);

  getProductInfo() async {
    emit(PriceRunnerLoading());
    HttpHelper.getProduct().then((productResult) {
      product = productResult;
      prices = productResult.prices;
      _addItemToDisplayedPrices();
      emit(PriceRunnerLoaded());
    });
  }

  showMorePrices() {
    _addItemToDisplayedPrices();
    emit(PriceRunnerShowMorePrices());
  }

  showLessPrices() {
    lengthOfDisplayedPrices =
        0; //reset displayed prices then add again by _addItemToPrices method
    _addItemToDisplayedPrices();
    emit(PriceRunnerShowLessPrices());
  }

  _addItemToDisplayedPrices() {
    displayedPrices.clear();
    if (lengthOfDisplayedPrices + 2 > prices.length) {
      lengthOfDisplayedPrices = prices.length;
    } else {
      lengthOfDisplayedPrices += 2;
    }
    for (int i = 0; i < lengthOfDisplayedPrices; i++) {
      displayedPrices.add(prices[i]);
    }
  }
}
