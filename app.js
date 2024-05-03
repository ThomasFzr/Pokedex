const express = require('express');
const pokemonRouter = require('./routes/pokemons');

const app = express();
const port = 3001;

app.use(express.json());
app.use('/api', pokemonRouter);


app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
