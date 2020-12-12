const router = require("express").Router();
const { getTariffByBusesId } = require("./tariff.controller")

router.get("/:id", getTariffByBusesId);

module.exports = router;