import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../block/UserCubit.dart';
import '../model/usermodel.dart';


// userList
class UserListPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar
      appBar: AppBar(title: Text('Block list'),),
      // here BlocBuilder<UserCubit,List<User>
      // this is a BlockBuilder
      body: BlocBuilder<UserCubit,List<User>>(
          builder: (context,data){
            if(data.isEmpty) {
              return 
                  Center(
                    child: CircularProgressIndicator(),
                  );
            }
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context,index){
                 final user = data[index];
                  return ListTile(
                    leading: Image.network(user.avatar),
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(user.email),
                  );
                });
          }),
    );
  }
}
