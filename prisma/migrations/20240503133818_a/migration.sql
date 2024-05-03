-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_pokemon_v2_pokemonspeciesdescription" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT NOT NULL,
    "language_id" INTEGER,
    "pokemon_species_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemonspeciesdescription_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_v2_pokemonspecies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspeciesdescription_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspeciesdescription_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_v2_pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO "new_pokemon_v2_pokemonspeciesdescription" ("description", "id", "language_id", "pokemon_species_id") SELECT "description", "id", "language_id", "pokemon_species_id" FROM "pokemon_v2_pokemonspeciesdescription";
DROP TABLE "pokemon_v2_pokemonspeciesdescription";
ALTER TABLE "new_pokemon_v2_pokemonspeciesdescription" RENAME TO "pokemon_v2_pokemonspeciesdescription";
CREATE INDEX "pokemon_v2_pokemonspeciesdescription_pokemon_species_id_c62bce07" ON "pokemon_v2_pokemonspeciesdescription"("pokemon_species_id");
CREATE INDEX "pokemon_v2_pokemonspeciesdescription_language_id_75b5e267" ON "pokemon_v2_pokemonspeciesdescription"("language_id");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
