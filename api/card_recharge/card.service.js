const pool = require("../../config/database");

module.exports = {
    createRecharge: (data, callBack) => {
        pool.query(
          `insert into card_recharge(quantity) values(?)`,
              [
               data.quantity
              ],
              (error, results, fields) => {
                if (error) {
                 callBack(error);
                 return;
                }
                return callBack(null, results);
            }
        );
    }
}