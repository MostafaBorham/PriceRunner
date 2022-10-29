part of 'price_runner_cubit.dart';

abstract class PriceRunnerState {
  const PriceRunnerState();
}

class PriceRunnerInitial extends PriceRunnerState {}

class PriceRunnerLoading extends PriceRunnerState {}

class PriceRunnerLoaded extends PriceRunnerState {}

class PriceRunnerShowMorePrices extends PriceRunnerState {}

class PriceRunnerShowLessPrices extends PriceRunnerState {}
