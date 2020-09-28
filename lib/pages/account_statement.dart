import 'package:flutter/material.dart';
import 'package:mock_banker/model/account_model.dart';
import 'package:mock_banker/model/firebase_service.dart';

class AccountStatement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        centerTitle: true,
        title: Text('News'),
      ),
      body: StreamBuilder(
        stream: FirestoreService().getAccount(),
        builder: (BuildContext context, AsyncSnapshot<List<Account>> snapshot) {
          if (snapshot.hasError || !snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Account account = snapshot.data[index];
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Colors.white,
                elevation: 15.0,
                child: ListTile(
                    title: Text(
                      account.accountName,
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400),
                    ),
                    subtitle: Text(
                      "by ${account.accountNumber}",
                      style: TextStyle(color: Colors.brown),
                    ),
                    trailing: Row(),
                    onTap: () {}),
              );
            },
          );
        },
      ),
    );
  }
}
