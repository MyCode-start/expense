part of 'expense_type_bloc.dart';

@immutable
abstract class ExpenseTypeState {}

class ExpenseTypeInitialState extends ExpenseTypeState {}

class ExpenseTypeLoadingState extends ExpenseTypeState{}

class ExpenseTypeLoadedState extends ExpenseTypeState{
  List<CatModel> arrExpenseType;
  ExpenseTypeLoadedState(this.arrExpenseType);
}

class ExpenseTypeErrorState extends ExpenseTypeState{
  String errorMsg;
  ExpenseTypeErrorState(this.errorMsg);
}