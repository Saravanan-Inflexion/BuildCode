const test_calculateTotalAmount_logic = require('./code/test-calculateTotalAmount-logic');
const cds = require('@sap/cds/lib');
const {
  GET,
  POST,
  PATCH,
  DELETE,
  expect
} = cds.test(__dirname + '../../', '--with-mocks');
cds.env.requires.auth = {
  kind: "dummy"
};
describe('Service Testing', () => {
  it('test calculateTotalAmount-logic', async () => {
    await test_calculateTotalAmount_logic(GET, POST, PATCH, DELETE, expect);
  });
});