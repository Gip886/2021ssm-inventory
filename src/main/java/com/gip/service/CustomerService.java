package com.gip.service;

import com.gip.pojo.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findAllCustomer();
    List<Customer> findAllCustomerByIf(Customer customer);
}
