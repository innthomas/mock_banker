import 'package:flutter/material.dart';
import 'package:mock_banker/model/account_model.dart';
import 'package:mock_banker/model/firebase_service.dart';

class AddAccountPage extends StatefulWidget {
  final Account account;

  const AddAccountPage({Key key, this.account}) : super(key: key);
  @override
  _AddAccountPageState createState() => _AddAccountPageState();
}

class _AddAccountPageState extends State<AddAccountPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _accountNameController;
  TextEditingController _accountNumberController;
  TextEditingController _phoneNumberController;
  TextEditingController _depositController;

  FocusNode _accountNode;

  @override
  void initState() {
    super.initState();
    _accountNameController = TextEditingController();
    _accountNumberController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _depositController = TextEditingController();
    _accountNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Account"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_accountNode);
                },
                controller: _accountNameController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "accountName cannot be empty";
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "accountName",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                focusNode: _accountNode,
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: "accountNumber",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: "phoneNumber",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _depositController,
                decoration: InputDecoration(
                  labelText: "initial Deposit",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text("Save"),
                onPressed: () async {
                  if (_key.currentState.validate()) {
                    Account account = Account(
                      accountName: _accountNameController.text,
                      accountNumber: num.parse(_accountNumberController.text),
                      deposit: double.parse(_depositController.text),
                      phoneNumber: int.parse(_phoneNumberController.text),
                      time: DateTime.now(),
                      accountBalance: double.parse(_depositController.text),
                      withrawal: 0.0,
                    );
                    await FirestoreService().addAccount(account);
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
