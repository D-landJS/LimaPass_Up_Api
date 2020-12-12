const { createUserPerfil, getUserPerfil } = require("./user_perfil.service");

module.exports = {
    createUserPerfil: (req, res) => {
        const body = req.body;
        createUserPerfil(body, (err, results) => {
          if (err) {
            console.log(err);
            return res.status(500).json({
              success: false,
              message: "Database connection error"
            });
          } console.log(body)
          return res.status(200).json({
            success: true
            })
        });
    },
    getUserPerfil: (req, res) => {
        getUserPerfil((err, results) => {
          if(err){
            console.log(err);
            return;
          }
          return res.status(200).json({
            success: true
          });
        });
      }
}