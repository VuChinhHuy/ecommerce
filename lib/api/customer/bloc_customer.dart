
import 'package:ecommerce/api/customer/customer_repository.dart';
import 'package:ecommerce/api/customer/customer_response.dart';
import 'package:rxdart/rxdart.dart';

class CustomerBloc{
  final CustomerRepository _customerRepository = CustomerRepository();
  final BehaviorSubject<CustomerResponse> _subject =
  BehaviorSubject<CustomerResponse>();

  getCustomer(String accountId) async{
    CustomerResponse customerResponse = await _customerRepository.getCustomer(accountId);
    _subject.sink.add(customerResponse);
  }
  dispose() {
    _subject.close();
  }

  BehaviorSubject<CustomerResponse> get subject => _subject;

}
final blocCustomer = CustomerBloc();