import 'package:ecommerce/api/customer/customer_api_provider.dart';
import 'package:ecommerce/api/customer/customer_response.dart';

class CustomerRepository{
  CustomerApiProvider _customerApiProvider = CustomerApiProvider();
  Future<CustomerResponse> getCustomer(String accountId){
    return _customerApiProvider.getCustomer(accountId);
  }
}