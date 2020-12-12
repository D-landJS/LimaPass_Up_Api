const pool = require("../../config/database");

module.exports = {
    getBusesByBusesId: (id, callBack) => {
        pool.query(
            `SELECT b.id as busId, b.busType, b.busName, r.id as RoutesId, r.direction, s.id as stopId, s.stop_name FROM buses b INNER JOIN routes r on b.id = r.buses_id INNER JOIN routes_stop rs ON r.id = rs.routes_id INNER JOIN stop s ON rs.stop_id = s.id where b.id = ?`,
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

