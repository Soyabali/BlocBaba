// ------Block file with a Cubit---

import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/counter_repository.dart';

class CounterCubit extends Cubit<int>{

  CounterCubit():super(0);// initial state or initial data
 // here you should create a function to perform a action
// these function may be any type of the work with a block

//   -----incrementFunction--
  // to creare a function to fetch api data
  
increment()=>emit(state+1);// emit is a function that is used to inter data into our function or state
decrement()=>emit(state-1);//

}