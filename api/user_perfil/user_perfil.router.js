const router = require("express").Router();
const { createUserPerfil, getUserPerfil } = require("./user_perfil.controller")

router.post("/", createUserPerfil);
router.get("/", getUserPerfil);

module.exports = router;