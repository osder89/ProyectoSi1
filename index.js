import express from "express";
import cors from "cors";
import session  from "express-session";
import path from "path";

import { PORT } from "./config.js";
import Routes from "./routes/Casos.routes.js";
// import passport from "passport";


// // //Video Pilco
//  const myconection = require("express-myconnection");
//  const mysql = require("mysql");
//  const bodyParser = require("body-parser");
// // //Fin video Pilco


//inicializaciones
const app = express();
// require("./passport.js");



app.use(express.json());
app.use(
  cors({
    origin: "*",
  })
);


app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));

// app.use(passport.initialize());
// app.use(passport.session());


app.use(Routes);

//inicializar el servidor
app.listen(PORT);
/*app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'static')));*/
console.log(`Server is running on port ${PORT}`);
