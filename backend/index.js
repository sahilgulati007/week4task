import express from "express";
import mysql from "mysql2";
import cors from "cors";
import bodyParser from "body-parser";

const PORT = 5555;
const app = express();
app.use(express.json());
app.use(cors());
app.use(bodyParser.urlencoded({
    extended: true
}));

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'risk_mgnt_db'
  });

app.get('/',(req, res)=>{
    res.send("<h1>Welcome to Backend</h1>");
    //return res.status(204).send("book stire");
});

app.get('/riskdata',async(req,res)=>{
    connection.query(
        'SELECT risk_id, risk_categories.category_name, risk_sources.source_name, buying_date, description, risk_probability, status, volume, value FROM risk_data Inner JOIN risk_categories on risk_data.category_id = risk_categories.category_id INNER JOIN risk_sources on risk_data.source_id = risk_sources.source_id;',
        function(err, results, fields) {
            
          console.log(results); // results contains rows returned by server
          console.log(fields); // fields contains extra meta data about results, if available
          return res.json({results});
        }
      );
});

app.post('/riskdata',async(req,res)=>{
connection.query('INSERT INTO `risk_data` (category_id, source_id, description, risk_probability, status, volume, value) VALUES (?,?,?,?,?,?,?)', [req.body.category_id, req.body.source_id, req.body.description, req.body.risk_probability, req.body.status, req.body.volume, req.body.value],(error, results) => {
     if (error) 
     {
        console.log(error);
        return res.json({ error: error });
    }
     else{
        console.log(results);
        return res.json({results});
     }
    
     });
});
app.get('/risksource',async(req,res)=>{
    connection.query(
        'SELECT * FROM `risk_sources`',
        function(err, results, fields) {
            
          console.log(results); // results contains rows returned by server
          console.log(fields); // fields contains extra meta data about results, if available
          return res.json({results});
        }
      );
});
app.post('/risksource',async(req,res)=>{
    connection.query('INSERT INTO `risk_sources` (`source_name`) VALUES(?)',[req.body.source_name],(error, results) => {
        if (error) 
        {
           console.log(error);
           return res.json({ error: error });
       }
        else{
           console.log(results);
           return res.json({results});
        }
       
    });
});
app.get('/riskcat',async(req,res)=>{
    connection.query(
        'SELECT * FROM `risk_categories`',
        function(err, results, fields) {
            
          console.log(results); // results contains rows returned by server
          console.log(fields); // fields contains extra meta data about results, if available
          return res.json({results});
        }
      );
});
app.post('/riskcat',async(req,res)=>{
    connection.query('INSERT INTO `risk_categories` (`category_name`) VALUES(?)',[req.body.catname],(error, results) => {
        if (error) 
        {
           console.log(error);
           return res.json({ error: error });
       }
        else{
           console.log(results);
           return res.json({results});
        }
       
    });
});

app.get('/risk_assessment_models',async(req,res)=>{
  connection.query(
      'SELECT * FROM `risk_assessment_models`',
      function(err, results, fields) {
          
        console.log(results); // results contains rows returned by server
        console.log(fields); // fields contains extra meta data about results, if available
        return res.json({results});
      }
    );
});


app.post('/risk_assessment_models',async(req,res)=>{
  connection.query('INSERT INTO `risk_assessment_models` (`model_name`, `description`, `methodology`, `created_by`) VALUES(?,?,?,?)',[req.body.model_name,req.body.description,req.body.methodology,req.body.created_by],(error, results) => {
      if (error) 
      {
         console.log(error);
         return res.json({ error: error });
     }
      else{
         console.log(results);
         return res.json({results});
      }
     
  });
});

app.get('/market_data',async(req,res)=>{
  connection.query(
      'SELECT * FROM `market_data`',
      function(err, results, fields) {
          
        console.log(results); // results contains rows returned by server
        console.log(fields); // fields contains extra meta data about results, if available
        return res.json({results});
      }
    );
});


app.post('/market_data',async(req,res)=>{
  connection.query('INSERT INTO `market_data` (risk_id	, market_name, market_value, highest_value, lowest_value) VALUES(?,?,?,?,?)',[req.body.risk_id,req.body.market_name,req.body.market_value,req.body.highest_value,req.body.lowest_value],(error, results) => {
      if (error) 
      {
         console.log(error);
         return res.json({ error: error });
     }
      else{
         console.log(results);
         return res.json({results});
      }
     
  });
});

app.listen(PORT, ()=>{
    console.log(`app is listening to port ${PORT}`);
});
  connection.query(
    'SELECT * FROM `risk_assessment_models`',
    function(err, results, fields) {
      console.log(results); // results contains rows returned by server
      console.log(fields); // fields contains extra meta data about results, if available
    }
  );