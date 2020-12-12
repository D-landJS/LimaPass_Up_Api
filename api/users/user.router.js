const router = require("express").Router();
const { checkToken } = require("../../auth/token_validation")
const { createUser,
    getUserByUserId,
    getUsers,
    updateUsers,
    deleteUser,
    login
} = require("./user.controller");


router.get("/", getUsers);
router.post("/", createUser);
router.get("/:id", getUserByUserId);
router.post("/login", login);
router.patch("/", updateUsers);
router.delete("/:id", deleteUser);

// router.get("/", checkToken, getUsers);
// router.post("/", checkToken, createUser);
// router.get("/:id", checkToken, getUserByUserId);
// router.post("/login", login);
// router.patch("/", checkToken, updateUsers);
// router.delete("/:id", checkToken, deleteUser);

module.exports = router;