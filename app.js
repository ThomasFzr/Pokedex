const express = require('express');
const sqlite3 = require('sqlite3');

const app = express();
const port = 3000;

// Connect to the SQLite database
const db = new sqlite3.Database('pokemon_db.sqlite3', (err) => {
  if (err) {
    console.error('Error connecting to the database:', err.message);
  } else {
    console.log('Connected to the database');
  }
});

// Define your routes

app.get('/', (req, res) => {
  res.send('Hello World!');
});

// Example route to query data from the database
app.get('/pokemon', (req, res) => {
  db.all('SELECT * FROM pokemon', (err, rows) => {
    if (err) {
      console.error('Error querying the database:', err.message);
      res.status(500).send('Internal Server Error');
    } else {
      res.json(rows);
    }
  });
});

// Start the Express server
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
