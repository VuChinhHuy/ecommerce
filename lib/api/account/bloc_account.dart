import 'package:ecommerce/api/account/account_repository.dart';
import 'package:ecommerce/api/account/account_response.dart';
import 'package:ecommerce/model/acount.dart';
import 'package:rxdart/rxdart.dart';

class BlocAccount{
  final AccountRepository _accountRepository = AccountRepository();
  final BehaviorSubject<AccountResponse> _subject = BehaviorSubject<AccountResponse>();

  getAccount(String userName) async {
    AccountResponse accountResponse = await _accountRepository.getAccount(userName);
    _subject.sink.add(accountResponse);
  }

  dispose(){
    _subject.close();
  }
  BehaviorSubject<AccountResponse> get subject => _subject;

}
final blocAccount = BlocAccount();