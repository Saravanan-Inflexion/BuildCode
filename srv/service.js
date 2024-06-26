/**
 * Code is auto-generated by Application Logic, DO NOT EDIT.
 * @version(2.0)
 */
const LCAPApplicationService = require('@sap/low-code-event-handler');
const calculateTotalAmount_Logic = require('./code/calculateTotalAmount-logic');

class salesorderSrv extends LCAPApplicationService {
    async init() {

        this.on(['CREATE', 'UPDATE'], 'SalesOrders', async (request, next) => {
            await calculateTotalAmount_Logic(request);
            return next();
        });

        return super.init();
    }
}


module.exports = {
    salesorderSrv
};