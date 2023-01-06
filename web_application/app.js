const express = require("express");
const app = express();
const ejs = require("ejs");
const port = 3000;
const bodyParser = require("body-parser");
// Setting up our static path and Body Parser
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static("public"));
app.set('view engine', 'ejs');

var orders = [];

app.listen(process.env.PORT || port, function() {
    console.log("server is listening the port");
});

app.get("/", function(req, res) {
    res.render(__dirname + "/views/home.ejs");
});

app.post("/", function(req, res) {
    const bodyy = req.body;
    console.log(bodyy.amount + " BTC is requested from customer");
    console.log(bodyy.wallet + " is the wallet address that customer wants to receive BTC");
    orders.push(bodyy.amount);
    orders.push(bodyy.wallet);
    res.redirect("/");
    // res.render(__dirname + "/views/home.ejs", {amount: bodyy.amount});
});

app.get("/orders", function(req, res) {
    res.render(__dirname + "/views/orders.ejs", {items: orders});
});
