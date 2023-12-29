part of 'investment_cubit.dart';

abstract class InvestmentState {}

class InvestmentInitial extends InvestmentState {}

class InvestmentLoading extends InvestmentState {}

class InvestmentLoaded extends InvestmentState {}

class InvestmentAmountChanged extends InvestmentState {
  final int investmentAmount;
  final int capitalAtMaturity;
  final int totalInterest;
  final double annualInterest;
  final int averageMaturityDateYear;

  InvestmentAmountChanged({
    required this.capitalAtMaturity,
    required this.investmentAmount,
    required this.totalInterest,
    required this.annualInterest,
    required this.averageMaturityDateYear,
  });
}
