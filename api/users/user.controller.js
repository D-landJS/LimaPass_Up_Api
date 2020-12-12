const axios = require('axios');
const { create,
  getUserByUserId,
  getUsers,
  updateUser,
  deleteUser,
  getUserByUserEmail } = require("./user.service");
const { genSaltSync, hashSync, compareSync} = require("bcrypt");
const { sign } = require("jsonwebtoken");
const { json } = require('express');

module.exports = {
  createUser: (req, res) => {
    let body = req.body;
    //consumiendo API Reniec
    axios.get(`https://dni.optimizeperu.com/api/persons/${body.dni}`).then((response) => {

      body = {
        name : response.data.name,
        firstName : response.data.first_name,
        lastName : response.data.last_name,
        dni : body.dni,
        email : body.email,
        password : body.password
      }

    function isValidate(body){
        return body.firstName && body.lastName && body.dni && body.email && body.password
    }

    if(!isValidate(body)){
      res.status(400).json({
        success: false,
        message: "Parametros requeridos"
      })
      return
    }
    const salt = genSaltSync(10);
    body.password = hashSync(body.password, salt);
    create(body, (err, id) => {

      if (err) {
        console.log(err);
          res.status(500).json({
          success: false,
          message: err.sqlMessage            
        });
        return;
      }
      console.log(id);
      res.status(200).json({
      success: true,
      data: {
        id: id
      }
      });
      
    });
      
  })

    
},
  getUserByUserId: (req, res) => {
    const id = req.params.id;
    getUserByUserId(id, (err, results) => {
      if(err) {
        console.log(err);
        return;
      }
      if(!results) {
        return res.status(500).json({
          success: false,
          message: "User not found"
        })
      }
      return res.status(200).json({
        success: true ,
        data: results
      })
    });
  },
  getUsers: (req, res) => {
    getUsers((err, results) => {
      if(err){
        console.log(err);
        return;
      }
      return res.status(200).json({
        success: true,
        data: results
      });
    });
  },
  updateUsers: (req, res) => {
    let body = req.body;
    //consumiendo API Reniec
    axios.get(`https://dni.optimizeperu.com/api/persons/${body.dni}`).then((response) => {

      body = {
        id : body.id,
        name : response.data.name,
        firstName : response.data.first_name,
        lastName : response.data.last_name,
        dni : body.dni,
        email : body.email,
        password : body.password
      }

    const salt = genSaltSync(10);
    body.password = hashSync(body.password, salt);
    updateUser(body, (err, results) => {
      if (err) {
        console.log(err);
          res.status(500).json({
          success: false,
          message: err.sqlMessage            
        });
        return;
      }
      if(results.affectedRows === 0) {
        return res.status(404).json({
          success: true,
          message: "User not found"
        });
      }
      res.status(200).json({
      success: true,
      message: "updated successfully"
      });
    });
  })
  },
  deleteUser: (req, res) => {
    const id = req.params.id;
    deleteUser(id, (err, results) => {
      if (err) {
        console.log(err);
        return res.status(500).json({
          success: false,
          message: err.sqlMessage
        });
      }
      if(results.affectedRows === 0) {
        return res.status(200).json({
          success: true,
          message: "User not found",
          error: err
        });
      }
      return res.status(200).json({
        success: true,
        message: "user deleted successfully"
      });
    });
  },
  login: (req, res) => {
    const body = req.body;
    getUserByUserEmail(body.email, (err, results) => {
      if (err) {
        console.log(err);
      }
      if (!results) {
        return res.json({
          success: false,
          errorMessage: "Existen campos obligatorios",
          errorMessageDetail: "Campos obligatorios: email"
        });
      }
      const result = compareSync(body.password, results.password);
      if (result) {
        const jsontoken = sign({ result: results }, process.env.JWT_KEY, {
          expiresIn: "1h"
        });
        return res.status(200).json({
          success: true,
          body:{
            message: "login successfully",
            data:{
              token: jsontoken,
              img_profile: false,
              user: {
              name:        results.name,
              firstname:   results.firstName,
              lastname:    results.lastName,
              cardType:    results.cardType,
              cardValue:   results.cardValue,
              studyCenter: results.studyCenter,
              usualBus:    results.usualBus
                }
           }
          }       
        });
      } else {
        return res.status(500).json({
          success: false,
          error: {
            errorMessage: "Existen campos obligatorios",
            errorMessageDetail: "Campos obligatorios: password"
          }
        });
      }
    });
  }
};