// -----Bloc------


// create a MyApp class
import 'package:blockbaba/block/counterCubit.dart';
import 'package:blockbaba/presengentation/loginScreen/loginScreen.dart';
import 'package:blockbaba/repository/counter_repository.dart';
import 'package:blockbaba/repository/login_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'block/UserCubit.dart';
import 'block/login_cubit.dart';
import 'blockObserver/blockObserver.dart';
import 'components/userlistpage.dart';

// to run the MyApp

void main(){
  // Apply Observer file
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // to put the Repository
  final UserRepository repository = UserRepository();
  final LoginRepo loginRepo = LoginRepo();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
         // firstBlock
          BlocProvider<CounterCubit>(
              create: (_)=>CounterCubit(),
          ),
          // secondBlock
          BlocProvider<UserCubit>(
              create: (_)=>UserCubit(repository)..loadUsers(),// call a api with bloc
          ),
          BlocProvider<LoginCubit>(
            create: (_) => LoginCubit(loginRepo),
          ),
        ],

        child: MaterialApp(
          //home: CounterPage(),
          home: LoginScreen(),
        ));
  }
}
// to create a new file to a ui
class CounterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // access bloc file
   final counterCubit = context.read<CounterCubit>();
    return Scaffold(
      // appBar
      appBar: AppBar(
        title: Text('Block'),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit,int>(
          builder: (context,data){
            return Text('$data',style: TextStyle(
              color: Colors.black,
              fontSize: 16
            ),);
          },
        ),
      ),
      // floating button
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: ()=>counterCubit.increment(),
             child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
              onPressed: ()=>counterCubit.decrement(),
            child: Icon(Icons.minimize),
          )
        ],
      ),
    );
  }
}

