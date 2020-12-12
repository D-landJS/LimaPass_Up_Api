require("dotenv").config();
var bodyParser = require('body-parser');
const express = require("express");
const app = express();
const userRouter = require("./api/users/user.router")
const userPerfilRouter = require("./api/user_perfil/user_perfil.router")
const busesRouter = require("./api/buses/buses.router")
const tariffRouter = require("./api/tariff/tariff.router")
const card_recharge = require("./api/card_recharge/card.router")

//Transforma de objecto js a json
app.use(express.json())

app.use("/api/users", userRouter);
app.use("/api/perfil", userPerfilRouter);
app.use("/api/buses", busesRouter);
app.use("/api/tariff", tariffRouter);
app.use("/api/card", card_recharge)

app.listen(process.env.APP_PORT, () => {
    console.log("Server up and running on PORT: " + process.env.APP_PORT);
})