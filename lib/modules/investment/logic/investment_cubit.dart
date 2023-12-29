import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';

part 'investment_state.dart';

class InvestmentCubit extends Cubit<InvestmentState> {
  InvestmentCubit() : super(InvestmentInitial()) {
    loading();
  }

  int investmentAmount = 10000;
  int capitalAtMaturity = 10681;
  int totalInterest = 681;
  double annualInterest = 68.1;
  int averageMaturityDateYear = 2026;
  int yearTerm = 3;
  bool thirdYearTermIsSelected = false;
  bool fifthYearTermIsSelected = false;

  void loading() {
    emit(InvestmentLoading());
    Future.delayed(const Duration(milliseconds: 1500), () {
      emit(InvestmentLoaded());
    });
  }

  void increaseAmount() {
    if (investmentAmount < 1000) {
      investmentAmount += 250;
    } else if (investmentAmount < 10000) {
      investmentAmount += 1000;
    } else {
      if (investmentAmount < 100000) {
        investmentAmount += 10000;
      } else if (investmentAmount < 1000000) {
        investmentAmount += 100000;
      } else {
        investmentAmount += 1000000;
      }
    }
    calculateCapitalAtMaturity();
  }

  void decreaseAmount() {
    if (investmentAmount <= 1000) {
      if (investmentAmount == 250) return;
      investmentAmount -= 250;
    } else if (investmentAmount <= 10000) {
      investmentAmount -= 1000;
    } else {
      if (investmentAmount <= 100000) {
        investmentAmount -= 10000;
      } else if (investmentAmount <= 1000000) {
        investmentAmount -= 100000;
      } else {
        investmentAmount -= 1000000;
      }
    }
    calculateCapitalAtMaturity();
  }

  void calculateCapitalAtMaturity() {
    capitalAtMaturity =
        ((0.0681 * yearTerm * investmentAmount) + investmentAmount).round();
    totalInterest = (0.0681 * yearTerm * investmentAmount).round();
    annualInterest = investmentAmount * 0.0681;
    final now = DateTime.now();
    averageMaturityDateYear = int.parse(DateFormat('y').format(now)) + yearTerm;
    emit(InvestmentAmountChanged(
      investmentAmount: investmentAmount,
      capitalAtMaturity: capitalAtMaturity,
      totalInterest: totalInterest,
      annualInterest: annualInterest,
      averageMaturityDateYear: averageMaturityDateYear,
    ));
  }

  void switchYearTerm(String name) {
    if (name == '3 Year Term') {
      yearTerm = 3;
      thirdYearTermIsSelected = true;
      fifthYearTermIsSelected = false;
    } else {
      yearTerm = 5;
      thirdYearTermIsSelected = false;
      fifthYearTermIsSelected = true;
    }
    emit(InvestmentAmountChanged(
      investmentAmount: investmentAmount,
      capitalAtMaturity: capitalAtMaturity,
      totalInterest: totalInterest,
      annualInterest: annualInterest,
      averageMaturityDateYear: averageMaturityDateYear,
    ));
  }
}
