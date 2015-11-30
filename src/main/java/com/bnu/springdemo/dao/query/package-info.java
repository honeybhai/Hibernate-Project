@org.hibernate.annotations.NamedQueries({

		@org.hibernate.annotations.NamedQuery(name = "getOrdersWithinPeriod", query = "SELECT s FROM SalesOrder s "
				+ "WHERE s.orderDate >= ? AND s.orderDate <= ?"),

		@org.hibernate.annotations.NamedQuery(name = "getOrdersWithDetails", query = "SELECT s FROM SalesOrder s "
				+ "JOIN FETCH s.customer c ORDER BY c.name"),

		@org.hibernate.annotations.NamedQuery(name = "getCustomerOrders", query = "SELECT s FROM SalesOrder s "
				+ "JOIN s.customer c WHERE c.customerId = ?"), })
package com.bnu.springdemo.dao.query;