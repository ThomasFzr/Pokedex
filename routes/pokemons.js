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
      }
    });
    const evolutionName = await prisma.pokemon_v2_pokemon.findFirst({
      where: {
        id: evolutions[0].evolved_species_id
      }
    })
    pokemon.evolution = {
      id : evolutionName.id,
      name : evolutionName.name
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

    //b---------------------desc-------------------------
    const desc = await prisma.pokemon_v2_pokemonspeciesdescription.findFirst({
      where : {
        pokemon_species_id : pokemon.pokemon_species_id
      }
    })
    if (desc) {
      pokemon.description = desc.description
    }else {
      pokemon.description = desc
    }
    //b---------------------desc-------------------------

    //c---------------------stats-------------------------
    const stats_d = await prisma.pokemon_v2_pokemonstat.findMany({
      where: {
        pokemon_id: pokemon.id
      },
      include: {
        pokemon_v2_stat: {
          select: {
            name: true
          }
        }
      }
    });
    
    const statsObject = stats_d.reduce((result, stat) => {
      console.log(result)
      result[stat.pokemon_v2_stat.name] = stat.base_stat;
      return result;
    }, {});
    
    pokemon.stats = statsObject;
    
    //c---------------------stats-------------------------



    res.json(pokemon);
  } catch (error) {
    console.error('Error querying the database:', error.message);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});





module.exports = router;
