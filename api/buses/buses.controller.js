const { getBusesByBusesId, getBuses } = require("./buses.service");

module.exports = {

      getBusesByBusesId: (req, res) => {
        const id = req.params.id;
        getBusesByBusesId(id, (err, results) => {
          if(err) {
            console.log(err);
            return;
          }
          if(!results) {
            return res.status(500).json({
              success: false,
              message: "Bus not found"
            })
          }

          return res.status(200).json({
            success: true ,
            buses: results
          })
        });
      }
}