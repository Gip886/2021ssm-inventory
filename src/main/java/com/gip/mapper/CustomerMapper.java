package com.gip.mapper;

import com.gip.pojo.Customer;

import java.util.List;

public interface CustomerMapper {
    List<Customer> findAllCustomer();
    //条件查找客户
    List<Customer> findAllCustomerByIf(Customer customer);
}
