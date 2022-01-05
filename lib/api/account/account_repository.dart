import 'package:ecommerce/api/account/account_api_provider.dart';
import 'package:ecommerce/api/account/account_response.dart';

class AccountRepository{
  AccountApiProvider _accountApiProvider = AccountApiProvider();
  Future<AccountResponse> getAccount(String userName) {
    return _accountApiProvider.getAccount(userName);
  }
}