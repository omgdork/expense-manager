const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  global.connection.query('select * from categories', (error, results) => {
    if (error) {
      errorHandler(res, error);
    } else {
      successHandler(res, results);
    }
  });
});

router.post('/', (req, res) => {
  const { title, description } = req.body;

  global.connection.query(`insert into categories (title, description) values ('${title}', '${description}')`, (error, results) => {
    if (error) {
      errorHandler(res, error);
    } else {
      successHandler(res, results);
    }
  });
});

function errorHandler(res, error) {
  res.send(JSON.stringify({
    status: 500,
    error: error,
    response: null,
  }));
}

function successHandler(res, results) {
  res.send(JSON.stringify({
    status: 200,
    error: null,
    response: results,
  }));
}

module.exports = router;
