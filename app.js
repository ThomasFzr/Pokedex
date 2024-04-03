const express = require('express');
const { PrismaClient } = require('@prisma/client');

const app = express();
const port = 3000;
const prisma = new PrismaClient();

app.get('/', (req, res) => {
  res.send('Hello World!');
});

// Route pour récupérer tous les pokémons
app.get('/pokemons', async (req, res) => {
  try {
    const pokemons = await prisma.pokemon_v2_pokemon.findMany();
    res.json(pokemons);
  } catch (error) {
    console.error('Error querying the database:', error.message);
    res.status(500).send('Internal Server Error');
  }
});

// Démarrer le serveur Express
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
