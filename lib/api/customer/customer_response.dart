import 'dart:convert';

import 'package:ecommerce/model/customer.dart';

class CustomerResponse{
  final Customer customer;
  final String error;
  CustomerResponse(this.customer, this.error);

  CustomerResponse.fromJson(String json) :
      customer = Customer.fromJson(jsonDecode(json)["hydra:member"]),
  error ="";

  CustomerResponse.withError(String errorValue):
      customer = Customer(),
  error = errorValue;
}

