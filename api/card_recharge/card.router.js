const router = require("express").Router();
const { createRecharge } = require("./card.controller")

router.post("/", createRecharge);

module.exports = router;