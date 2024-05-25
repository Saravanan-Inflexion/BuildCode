using { salesorderSrv } from '../srv/service.cds';

annotate salesorderSrv.SalesOrders with @UI.HeaderInfo: { TypeName: 'Sales Order', TypeNamePlural: 'Sales Orders', Title: { Value: orderNumber } };
annotate salesorderSrv.SalesOrders with {
  ID @UI.Hidden @Common.Text: { $value: orderNumber, ![@UI.TextArrangement]: #TextOnly }
};
annotate salesorderSrv.SalesOrders with @UI.Identification: [{ Value: orderNumber }];
annotate salesorderSrv.SalesOrders with @UI.DataPoint #customerName: {
  Value: customerName,
  Title: 'Customer Name',
};
annotate salesorderSrv.SalesOrders with @UI.DataPoint #orderDate: {
  Value: orderDate,
  Title: 'Order Date',
};
annotate salesorderSrv.SalesOrders with @UI.DataPoint #status: {
  Value: status,
  Title: 'Status',
};
annotate salesorderSrv.SalesOrders with {
  orderNumber @title: 'Order Number';
  customerName @title: 'Customer Name';
  orderDate @title: 'Order Date';
  status @title: 'Status'
};

annotate salesorderSrv.SalesOrders with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: orderNumber },
    { $Type: 'UI.DataField', Value: customerName },
    { $Type: 'UI.DataField', Value: orderDate },
    { $Type: 'UI.DataField', Value: status }
];

annotate salesorderSrv.SalesOrders with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: orderNumber },
    { $Type: 'UI.DataField', Value: customerName },
    { $Type: 'UI.DataField', Value: orderDate },
    { $Type: 'UI.DataField', Value: status }
  ]
};

annotate salesorderSrv.SalesOrders with {
  items @Common.Label: 'Sales Order Items'
};

annotate salesorderSrv.SalesOrders with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#customerName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#orderDate' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#status' }
];

annotate salesorderSrv.SalesOrders with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'SalesOrderItems', Target : 'items/@UI.LineItem' }
];

annotate salesorderSrv.SalesOrders with @UI.SelectionFields: [
  orderNumber
];

annotate salesorderSrv.SalesOrderItems with @UI.HeaderInfo: { TypeName: 'Sales Order Item', TypeNamePlural: 'Sales Order Items' };
annotate salesorderSrv.SalesOrderItems with {
  order @Common.ValueList: {
    CollectionPath: 'SalesOrders',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: order_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'orderNumber'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'orderDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status'
      },
    ],
  }
};
annotate salesorderSrv.SalesOrderItems with @UI.DataPoint #itemName: {
  Value: itemName,
  Title: 'Item Name',
};
annotate salesorderSrv.SalesOrderItems with @UI.DataPoint #quantity: {
  Value: quantity,
  Title: 'Quantity',
};
annotate salesorderSrv.SalesOrderItems with @UI.DataPoint #price: {
  Value: price,
  Title: 'Price',
};
annotate salesorderSrv.SalesOrderItems with {
  itemName @title: 'Item Name';
  quantity @title: 'Quantity';
  price @title: 'Price'
};

annotate salesorderSrv.SalesOrderItems with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: itemName },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: price }
];

annotate salesorderSrv.SalesOrderItems with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: itemName },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: price }
  ]
};

annotate salesorderSrv.SalesOrderItems with {
  order @Common.Text: { $value: order.orderNumber, ![@UI.TextArrangement]: #TextOnly }
};

annotate salesorderSrv.SalesOrderItems with {
  order @Common.Label: 'Sales Order'
};

annotate salesorderSrv.SalesOrderItems with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#itemName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#quantity' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#price' }
];

annotate salesorderSrv.SalesOrderItems with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate salesorderSrv.SalesOrderItems with @UI.SelectionFields: [
  order_ID
];

