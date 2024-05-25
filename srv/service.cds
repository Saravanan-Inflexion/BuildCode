using { salesorder as my } from '../db/schema.cds';

@path: '/service/salesorder'
@requires: 'authenticated-user'
service salesorderSrv {
  @odata.draft.enabled
  entity SalesOrders as projection on my.SalesOrders;
}