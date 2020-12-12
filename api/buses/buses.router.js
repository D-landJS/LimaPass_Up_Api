const router = require("express").Router();
const { getBuses, getBusesByBusesId } = require("./buses.controller")

// router.get("/", getBuses);
router.get("/:id", getBusesByBusesId);

module.exports = router;