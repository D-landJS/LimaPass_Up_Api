const pool = require("../../config/database");

module.exports = {
    createUserPerfil: (data, callBack) => {
      pool.query(
        `insert into user_perfil(cardType, cardValue, studyCenter , usualBus, user_id) 
        values(?,?,?,?,?)`,
            [
             data.cardType,
             data.cardValue,
             data.studyCenter,
             data.usualBus,
             data.user_id
            ],
            (error, results, fields) => {
                if (error) {
                 callBack(error);
                 return;
                }
                return callBack(null, results);
            }
        );
    },
    getUserPerfil: callBack => {
        pool.query(
             `SELECT u.firstName, u.lastName, u.dni, u.email, us.cardType, us.cardValue, us.studyCenter ,us.usualBus from user_perfil as us 
             INNER JOIN users as u on us.user_id = u.id`,
            [],
            (error, results, fields) => {
                if (error) {
                 callBack(error);
                }
                return callBack(null, results);
            } 
        );
    },
    updateUserPerfil: callBack => {
        pool.query(
            `update users set firstName=?, lastName=?, dni= ?, email=?, password=? where id = ?`,
            [
             data.firstName,
             data.lastName,
             data.dni,
             data.email,
             data.password,
             data.id
            ],
           (error, results, fields) => {
               if (error) {
                callBack(error);
               }
               return callBack(null, results);
           } 
       );
    }
};


