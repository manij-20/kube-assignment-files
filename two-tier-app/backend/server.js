const express = require("express");
const mysql = require("mysql");

const app = express();

const connection = mysql.createConnection({
  host: "mysql",
  user: "root",
  password: "admin123",
  database: "testdb"
});

connection.connect((err)=>{
if(err){
console.log("Database connection failed");
}else{
console.log("Connected to MySQL");
}
});

// Enable CORS
app.use((req,res,next)=>{
res.setHeader("Access-Control-Allow-Origin","*")
res.setHeader("Access-Control-Allow-Methods","GET,POST,PUT,DELETE")
res.setHeader("Access-Control-Allow-Headers","Content-Type")
next()
})

app.get("/",(req,res)=>{
res.send("Backend API Running")
})

app.get("/users",(req,res)=>{
connection.query("SELECT * FROM users",(err,result)=>{
if(err) throw err
res.json(result)
})
})

app.listen(3000,()=>{
console.log("Server running on port 3000")
})
