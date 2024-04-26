const express = require('express');
const { PrismaClient } = require('@prisma/client');

const router = express.Router();
const prisma = new PrismaClient();

// Endpoint pour obtenir tous les pokemons
router.get('/pokemons', async (req, res) => {
  try {
    const pokemons = await prisma.pokemon_v2_pokemon.findMany();
    res.json(pokemons);
  } catch (error) {
    console.error('Error querying the database:', error.message);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});




router.get('/pokemons/:name', async (req, res) => {
  const name = req.params.name;
  try {
    const pokemon = await prisma.pokemon_v2_pokemon.findFirst({
      where: {
        name: name
      }
    });

    if (!pokemon) {
      return res.status(404).json({ error: 'Pokemon not found' });
    }

    const types = pokemon.pokemon_v2_pokemontype.map(pokemontype => pokemontype.pokemon_v2_type.name);
    // delete pokemon.pokemon_v2_pokemontype;
    pokemon.types = types;
    
    res.json(pokemon);
  } catch (error) {
    console.error('Error querying the database:', error.message);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});









    module.exports = router;
