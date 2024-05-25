/**
 * Given a running CAP service, the unit test should be able to get passed.
 *
 * @param {Function} GET - The `axios` function to send a GET request
 * @param {Function} POST - The `axios` function to send a POST request
 * @param {Function} PATCH - The `axios` function to send a PATCH request
 * @param {Function} DELETE - The `axios` function to send a DELETE request
 * @param {Function} expect - The `chai` function to assert the response
 */
module.exports = async function(GET, POST, PATCH, DELETE, expect) {
  // Create a new draft
  let response = await POST('/service/salesorder/SalesOrders', {
    orderNumber: '1234567890',
    customerName: 'John Doe',
    orderDate: '2022-01-01',
    status: 'New',
    items: [
      { itemName: 'Item 1', quantity: 2, price: 10.00 },
      { itemName: 'Item 2', quantity: 3, price: 20.00 }
    ]
  });
  expect(response.status).to.be.oneOf([200, 201]);

  // Get the ID of the created draft
  const draftID = response.data.ID;

  // Activate the draft
  response = await POST(`/service/salesorder/SalesOrders(ID=${draftID},IsActiveEntity=false)/salesorderSrv.draftActivate`);
  expect(response.status).to.be.oneOf([200, 201]);

  // Get the created order
  response = await GET(`/service/salesorder/SalesOrders(ID=${draftID},IsActiveEntity=true)`);
  expect(response.status).to.equal(200);

  // Check the total amount
  const totalAmount = response.data.totalAmount;
  expect(totalAmount).to.equal(90.00); // 2*10.00 + 3*20.00 = 90.00
};