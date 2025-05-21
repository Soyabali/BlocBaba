import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/userlistpage.dart';
import '../../main.dart';

class Dashboardscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Four Containers"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: (){
                  print('--------');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserListPage()),
                  );
                },
                child: buildContainer("UserList", Colors.red)),
            SizedBox(height: 16),
            InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CounterPage()),
                  );
                },

                child: buildContainer("Counter", Colors.green)),
            SizedBox(height: 16),
            buildContainer("Container Three", Colors.blue),
            SizedBox(height: 16),
            buildContainer("Container Four", Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(String label, Color color) {
    return Container(
      height: 60,
      width: 250,
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}