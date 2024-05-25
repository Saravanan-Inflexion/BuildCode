namespace salesorder;

entity SalesOrders {
  key ID: UUID;
  orderNumber: String(10) @assert.unique @mandatory;
  customerName: String(100);
  orderDate: Date;
  status: String(20);
  items: Composition of many SalesOrderItems on items.order = $self;
}

entity SalesOrderItems {
  key ID: UUID;
  itemName: String(100);
  quantity: Integer;
  price: Decimal(10,2);
  order: Association to SalesOrders;
}

