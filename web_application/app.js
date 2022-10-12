const express = require("express");
const app = express();
const ejs = require("ejs");
const port = 3000;
const bodyParser = require("body-parser");
// Setting up our static path and Body Parser
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static("public"));
app.set('view engine', 'ejs');

app.listen(process.env.PORT || port, function() {
    console.log("server is listening the port");
});

app.get("/", function(req, res) {
    res.render(__dirname + "/views/home.ejs");
});

app.post("/", function(req, res) {
    const bodyy = req.body;
    console.log(bodyy);
    res.render(__dirname + "/views/home.ejs", {});
});
