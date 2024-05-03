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

router.get('/caca', async (req, res) => {
  try {
    const pokemons = await prisma.pokemon_v2_pokemonspecies.findMany();
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
      },
      include: {
        pokemon_v2_pokemontype: {
          select: {
            pokemon_v2_type: {
              select: {
                name: true
              }
            }
          }
        },
        pokemon_v2_pokemonspecies: {
          select: {
            pokemon_v2_pokemondexnumber: true,
            pokemon_v2_pokemonhabitat:{
              select: {
                name : true
              }
            }
          }
        }
      }
    });

    if (!pokemon) {
      return res.status(404).json({ error: 'Pokemon not found' });
    }
    
    //a---------------------type-------------------------
    const types = pokemon.pokemon_v2_pokemontype.map(pokemontype => pokemontype.pokemon_v2_type.name);
    delete pokemon.pokemon_v2_pokemontype;
    pokemon.types = types;
    //a---------------------type-------------------------


    //b---------------------evolution-------------------------
    const evolutions = await prisma.pokemon_v2_pokemonevolution.findMany({
      where: {
        id: pokemon.id
      },
      select: {
        evolved_species_id: true
      }
    });
    const evolutionName = await prisma.pokemon_v2_pokemon.findFirst({
      where: {
        id: evolutions.evolved_species_id
      }
    })
    pokemon.evolution = {
      name: evolutionName.name,
      id: evolutionName.id
    }
    //b---------------------evolution-------------------------


  
    //c---------------------pokedex-------------------------
    
    const pokemonDexNumber = pokemon.pokemon_v2_pokemonspecies.pokemon_v2_pokemondexnumber;
    delete pokemon.pokemon_v2_pokemonspecies.pokemon_v2_pokemondexnumber
    pokemon.pokedex_number = pokemonDexNumber[0].pokedex_number
    
    //c---------------------pokedex-------------------------


    //a---------------------habitat-------------------------
    const temp = pokemon.pokemon_v2_pokemonspecies.pokemon_v2_pokemonhabitat.name
    delete pokemon.pokemon_v2_pokemonspecies.pokemon_v2_pokemonhabitat
    pokemon.habitat = temp


    //a---------------------habitat-------------------------




    res.json(pokemon);
  } catch (error) {
    console.error('Error querying the database:', error.message);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});





module.exports = router;
