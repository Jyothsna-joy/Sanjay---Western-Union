const express = require("express");
const app = express()
const fetch = require('node-fetch');
const mysql = require('mysql2'); 

var db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "sanjuzz",
    database: "test"
});

db.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL Server!');
});


let url = "https://api.github.com/users";

let method = { method: "Get" };

app.get("/send", (req, res) => {
    let query="";
    fetch(url, method)
        .then(res => res.json())
        .then((json) => {
            json.map((data,index) => {
                query += `("${data.id}","${data.type}","${data.site_admin}","${data.node_id}","${data.avatar_url}","${data.url}","${data.repos_url}")`;
                if(index+1<Object.keys(json).length){
                    query+=","
                }
            })
            let sql = `INSERT INTO data (id,type,siteAdmin,nodeId,avatarUrl,url,reposUrl) VALUES ` + query;
            db.query(sql,(err,result)=>{
                if (err) throw err;
                res.status(200).json({
                    code: 200,
                    status: "OK"
                  })       
            })
        });
})
app.get("/getData",(req,res)=>{
    let qry="SELECT * FROM data"
    db.query(qry,(err,result)=>{
        if (err) throw err;
        res.status(200).json({
            code: 200,
            status: "OK",
            data:result
          })       
    })
})
app.listen(8000, (req, res) => {
    console.log("Listening to port 8000")
})