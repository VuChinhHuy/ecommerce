import 'dart:convert';

import 'package:ecommerce/model/acount.dart';

class AccountResponse{
  final Account account;
  final String Error;
  AccountResponse(this.account,this.Error);

  AccountResponse.fromJson(String json) : account
      = Account.fromJson(jsonDecode(json)["hydra:member"]),
  Error ="";

  AccountResponse.withError(String errorValue) :
      account = Account(),
      Error = errorValue;

}