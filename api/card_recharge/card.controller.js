const { createRecharge } = require("./card.service");

module.exports = {
    createRecharge: (req, res) => {
        const body = req.body;
        createRecharge(body, (err, results) => {
          if (err) {
            console.log(err);
            return res.status(500).json({
              success: false,
              message: "Database connection error"
            });
          }
          return res.status(401).json({
            success: false,
            errorCode: 401,
            errorMessage: "La contraseña es incorrecta, inténtalo nuevamente",
            errorMessageDetail: "La contraseña es incorrecta"
            })
        });
    }
}