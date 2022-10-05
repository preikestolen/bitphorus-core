const express = require("express");
const app = express();
const port = 3000;
const bodyParser = require("body-parser");
// Setting up our static path and Body Parser
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static("public"));

app.listen(process.env.PORT || port, function() {
    console.log("server is listening the port");
});

app.get("/", function(req, res) {
    res.sendFile(__dirname + "/public/home.html");
});

app.post("/", function(req, res) {

});
