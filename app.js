const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const app = express();
const port = process.env.PORT || 4001;

const categories = require('./routes/categories');

app.use(bodyParser.urlencoded({ extended: false }));

app.use((req, res, next) => {
  global.connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'expense_manager',
  });
  connection.connect();
  next();
});

app.use('/categories', categories);

app.listen(port, () => {
  console.log(`listening at port ${port}`);
});
