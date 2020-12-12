const pool = require("../../config/database");

module.exports = {
    
    getTariffByBusesId: (id, callBack) => {
        pool.query(
            ` select * from tariff t inner join buses b on t.buses_id = b.id where b.id = ?`,
           [id],
           (error, results, fields) => {
               if (error) {
                callBack(error);
               }
               return callBack(null, results);
           } 
       );
    }  
};

