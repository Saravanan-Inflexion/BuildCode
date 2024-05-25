/**
 * 
 * @Before(event = { "UPDATE","CREATE" }, entity = "salesorderSrv.SalesOrders")
 * @param {Object} req - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(req) {
    // Get the items from the request data
    const items = req.data.items;

    // Calculate the total amount
    let totalAmount = 0;
    for (let item of items) {
        totalAmount += item.quantity * item.price;
    }

    // Add the total amount to the request data
    req.data.totalAmount = totalAmount;
}