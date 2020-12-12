const pool = require("../../config/database");

module.exports = {
    create: (data, callBack) => {
      pool.query(
        `insert into users(name, firstName, lastName, dni, email, password) 
        values(?,?,?,?,?,?)`,
            [
             data.name,
             data.firstName,
             data.lastName,
             data.dni,
             data.email,
             data.password
            ],
            (error, results, fields) => {
                if (error) {
                 callBack(error);
                 return;
                }
                 callBack(null, results.insertId);
            }
        );
    },
    getUsers: callBack => {
        pool.query(
             `select id, name, firstName, lastName, dni, email from users`,
            [],
            (error, results, fields) => {
                if (error) {
                 callBack(error);
                }
                return callBack(null, results);
            } 
        );
    },
    getUserByUserId: (id, callBack) => {
        pool.query(
            `select id, name, firstName, lastName, dni, email from users where id = ?`,
           [id],
           (error, results, fields) => {
               if (error) {
                callBack(error);
               }
               return callBack(null, results[0]);
           } 
       );
    },
    updateUser: (data, callBack) => {
        pool.query(
            `update users set name=?, firstName=?, lastName=?, dni= ?, email=?, password=? where id = ?`,
            [
             data.name,
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
                return;
               }
               return callBack(null, results);
           } 
       );
    },
    deleteUser: (id, callBack) => {
        pool.query(
          `delete from users where id = ?`,
          [id],
          (err, results, fields) => {
              if (err) {
               callBack(err);
              }
              return callBack(null, results);
          } 
      );
   },
    getUserByUserEmail: (email, callBack) => {
        pool.query(
            `SELECT u.name, u.firstName, u.lastName, u.dni, u.email, u.password, us.cardType, us.cardValue, us.studyCenter ,us.usualBus from user_perfil as us 
            INNER JOIN users as u on us.user_id = u.id where u.email = ?`,
            [email],
            (error, results, fields) => {
                if (error) {
                 callBack(error);
                }
                return callBack(null, results[0]);
            } 
        )
    }
};

