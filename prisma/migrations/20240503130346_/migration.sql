/*
  Warnings:

  - You are about to alter the column `is_hidden` on the `pokemon_v2_pokemonability` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `needs_overworld_rain` on the `pokemon_v2_pokemonevolution` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `turn_upside_down` on the `pokemon_v2_pokemonevolution` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `is_main_series` on the `pokemon_v2_ability` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `is_hidden` on the `pokemon_v2_pokemonabilitypast` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `official` on the `pokemon_v2_language` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `forms_switchable` on the `pokemon_v2_pokemonspecies` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `has_gender_differences` on the `pokemon_v2_pokemonspecies` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `is_baby` on the `pokemon_v2_pokemonspecies` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `is_legendary` on the `pokemon_v2_pokemonspecies` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `is_mythical` on the `pokemon_v2_pokemonspecies` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `is_default` on the `pokemon_v2_encounterconditionvalue` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `is_battle_only` on the `pokemon_v2_pokemonform` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `is_default` on the `pokemon_v2_pokemonform` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `is_mega` on the `pokemon_v2_pokemonform` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `is_active` on the `auth_user` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `is_staff` on the `auth_user` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `is_superuser` on the `auth_user` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `is_main_series` on the `pokemon_v2_pokedex` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `is_default` on the `pokemon_v2_pokemon` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `is_battle_only` on the `pokemon_v2_stat` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_pokemon_v2_pokemonability" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "is_hidden" BOOLEAN NOT NULL,
    "slot" INTEGER NOT NULL,
    "ability_id" INTEGER,
    "pokemon_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemonability_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon_v2_pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonability_ability_id_fkey" FOREIGN KEY ("ability_id") REFERENCES "pokemon_v2_ability" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO "new_pokemon_v2_pokemonability" ("ability_id", "id", "is_hidden", "pokemon_id", "slot") SELECT "ability_id", "id", "is_hidden", "pokemon_id", "slot" FROM "pokemon_v2_pokemonability";
DROP TABLE "pokemon_v2_pokemonability";
ALTER TABLE "new_pokemon_v2_pokemonability" RENAME TO "pokemon_v2_pokemonability";
CREATE INDEX "pokemon_v2_pokemonability_pokemon_id_2d9f606f" ON "pokemon_v2_pokemonability"("pokemon_id");
CREATE INDEX "pokemon_v2_pokemonability_ability_id_e6de97cc" ON "pokemon_v2_pokemonability"("ability_id");
CREATE TABLE "new_pokemon_v2_pokemonevolution" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "min_level" INTEGER,
    "time_of_day" TEXT,
    "min_happiness" INTEGER,
    "min_affection" INTEGER,
    "relative_physical_stats" INTEGER,
    "needs_overworld_rain" BOOLEAN NOT NULL,
    "turn_upside_down" BOOLEAN NOT NULL,
    "evolution_trigger_id" INTEGER,
    "evolved_species_id" INTEGER,
    "gender_id" INTEGER,
    "known_move_id" INTEGER,
    "known_move_type_id" INTEGER,
    "party_species_id" INTEGER,
    "party_type_id" INTEGER,
    "trade_species_id" INTEGER,
    "min_beauty" INTEGER,
    "evolution_item_id" INTEGER,
    "held_item_id" INTEGER,
    "location_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemonevolution_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "pokemon_v2_location" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonevolution_held_item_id_fkey" FOREIGN KEY ("held_item_id") REFERENCES "pokemon_v2_item" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonevolution_evolution_item_id_fkey" FOREIGN KEY ("evolution_item_id") REFERENCES "pokemon_v2_item" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonevolution_trade_species_id_fkey" FOREIGN KEY ("trade_species_id") REFERENCES "pokemon_v2_pokemonspecies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonevolution_party_type_id_fkey" FOREIGN KEY ("party_type_id") REFERENCES "pokemon_v2_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonevolution_party_species_id_fkey" FOREIGN KEY ("party_species_id") REFERENCES "pokemon_v2_pokemonspecies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonevolution_known_move_type_id_fkey" FOREIGN KEY ("known_move_type_id") REFERENCES "pokemon_v2_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonevolution_known_move_id_fkey" FOREIGN KEY ("known_move_id") REFERENCES "pokemon_v2_move" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonevolution_gender_id_fkey" FOREIGN KEY ("gender_id") REFERENCES "pokemon_v2_gender" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonevolution_evolved_species_id_fkey" FOREIGN KEY ("evolved_species_id") REFERENCES "pokemon_v2_pokemonspecies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonevolution_evolution_trigger_id_fkey" FOREIGN KEY ("evolution_trigger_id") REFERENCES "pokemon_v2_evolutiontrigger" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonevolution_evolved_species_id_fkey" FOREIGN KEY ("evolved_species_id") REFERENCES "pokemon_v2_pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO "new_pokemon_v2_pokemonevolution" ("evolution_item_id", "evolution_trigger_id", "evolved_species_id", "gender_id", "held_item_id", "id", "known_move_id", "known_move_type_id", "location_id", "min_affection", "min_beauty", "min_happiness", "min_level", "needs_overworld_rain", "party_species_id", "party_type_id", "relative_physical_stats", "time_of_day", "trade_species_id", "turn_upside_down") SELECT "evolution_item_id", "evolution_trigger_id", "evolved_species_id", "gender_id", "held_item_id", "id", "known_move_id", "known_move_type_id", "location_id", "min_affection", "min_beauty", "min_happiness", "min_level", "needs_overworld_rain", "party_species_id", "party_type_id", "relative_physical_stats", "time_of_day", "trade_species_id", "turn_upside_down" FROM "pokemon_v2_pokemonevolution";
DROP TABLE "pokemon_v2_pokemonevolution";
ALTER TABLE "new_pokemon_v2_pokemonevolution" RENAME TO "pokemon_v2_pokemonevolution";
CREATE INDEX "pokemon_v2_pokemonevolution_location_id_fb0e2aa2" ON "pokemon_v2_pokemonevolution"("location_id");
CREATE INDEX "pokemon_v2_pokemonevolution_held_item_id_ef69a719" ON "pokemon_v2_pokemonevolution"("held_item_id");
CREATE INDEX "pokemon_v2_pokemonevolution_evolution_item_id_afdb70a5" ON "pokemon_v2_pokemonevolution"("evolution_item_id");
CREATE INDEX "pokemon_v2_pokemonevolution_trade_species_id_6eefecdc" ON "pokemon_v2_pokemonevolution"("trade_species_id");
CREATE INDEX "pokemon_v2_pokemonevolution_party_type_id_6af7cb68" ON "pokemon_v2_pokemonevolution"("party_type_id");
CREATE INDEX "pokemon_v2_pokemonevolution_party_species_id_aa57f0d1" ON "pokemon_v2_pokemonevolution"("party_species_id");
CREATE INDEX "pokemon_v2_pokemonevolution_known_move_type_id_de1a6bf4" ON "pokemon_v2_pokemonevolution"("known_move_type_id");
CREATE INDEX "pokemon_v2_pokemonevolution_known_move_id_301dfc54" ON "pokemon_v2_pokemonevolution"("known_move_id");
CREATE INDEX "pokemon_v2_pokemonevolution_gender_id_ccbf258a" ON "pokemon_v2_pokemonevolution"("gender_id");
CREATE INDEX "pokemon_v2_pokemonevolution_evolved_species_id_bcbf43a3" ON "pokemon_v2_pokemonevolution"("evolved_species_id");
CREATE INDEX "pokemon_v2_pokemonevolution_evolution_trigger_id_7d6a5102" ON "pokemon_v2_pokemonevolution"("evolution_trigger_id");
CREATE TABLE "new_pokemon_v2_ability" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "is_main_series" BOOLEAN NOT NULL,
    "generation_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_ability_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "pokemon_v2_generation" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO "new_pokemon_v2_ability" ("generation_id", "id", "is_main_series", "name") SELECT "generation_id", "id", "is_main_series", "name" FROM "pokemon_v2_ability";
DROP TABLE "pokemon_v2_ability";
ALTER TABLE "new_pokemon_v2_ability" RENAME TO "pokemon_v2_ability";
CREATE INDEX "pokemon_v2_ability_name_744d1800" ON "pokemon_v2_ability"("name");
CREATE INDEX "pokemon_v2_ability_generation_id_225aa68a" ON "pokemon_v2_ability"("generation_id");
CREATE TABLE "new_pokemon_v2_pokemonabilitypast" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "is_hidden" BOOLEAN NOT NULL,
    "slot" INTEGER NOT NULL,
    "ability_id" INTEGER,
    "generation_id" INTEGER,
    "pokemon_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemonabilitypast_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon_v2_pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonabilitypast_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "pokemon_v2_generation" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonabilitypast_ability_id_fkey" FOREIGN KEY ("ability_id") REFERENCES "pokemon_v2_ability" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO "new_pokemon_v2_pokemonabilitypast" ("ability_id", "generation_id", "id", "is_hidden", "pokemon_id", "slot") SELECT "ability_id", "generation_id", "id", "is_hidden", "pokemon_id", "slot" FROM "pokemon_v2_pokemonabilitypast";
DROP TABLE "pokemon_v2_pokemonabilitypast";
ALTER TABLE "new_pokemon_v2_pokemonabilitypast" RENAME TO "pokemon_v2_pokemonabilitypast";
CREATE INDEX "pokemon_v2_pokemonabilitypast_pokemon_id_1f8eef75" ON "pokemon_v2_pokemonabilitypast"("pokemon_id");
CREATE INDEX "pokemon_v2_pokemonabilitypast_generation_id_7c49a4a1" ON "pokemon_v2_pokemonabilitypast"("generation_id");
CREATE INDEX "pokemon_v2_pokemonabilitypast_ability_id_27ce43f2" ON "pokemon_v2_pokemonabilitypast"("ability_id");
CREATE TABLE "new_pokemon_v2_language" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "iso3166" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "official" BOOLEAN NOT NULL,
    "order" INTEGER,
    "iso639" TEXT NOT NULL
);
INSERT INTO "new_pokemon_v2_language" ("id", "iso3166", "iso639", "name", "official", "order") SELECT "id", "iso3166", "iso639", "name", "official", "order" FROM "pokemon_v2_language";
DROP TABLE "pokemon_v2_language";
ALTER TABLE "new_pokemon_v2_language" RENAME TO "pokemon_v2_language";
CREATE INDEX "pokemon_v2_language_name_012b2a8c" ON "pokemon_v2_language"("name");
CREATE TABLE "new_pokemon_v2_pokemonspecies" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "order" INTEGER,
    "gender_rate" INTEGER,
    "capture_rate" INTEGER,
    "base_happiness" INTEGER,
    "is_baby" BOOLEAN NOT NULL,
    "hatch_counter" INTEGER,
    "has_gender_differences" BOOLEAN NOT NULL,
    "forms_switchable" BOOLEAN NOT NULL,
    "evolution_chain_id" INTEGER,
    "generation_id" INTEGER,
    "growth_rate_id" INTEGER,
    "pokemon_color_id" INTEGER,
    "pokemon_habitat_id" INTEGER,
    "pokemon_shape_id" INTEGER,
    "is_legendary" BOOLEAN NOT NULL,
    "is_mythical" BOOLEAN NOT NULL,
    "evolves_from_species_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemonspecies_evolves_from_species_id_fkey" FOREIGN KEY ("evolves_from_species_id") REFERENCES "pokemon_v2_pokemonspecies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspecies_pokemon_shape_id_fkey" FOREIGN KEY ("pokemon_shape_id") REFERENCES "pokemon_v2_pokemonshape" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspecies_pokemon_habitat_id_fkey" FOREIGN KEY ("pokemon_habitat_id") REFERENCES "pokemon_v2_pokemonhabitat" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspecies_pokemon_color_id_fkey" FOREIGN KEY ("pokemon_color_id") REFERENCES "pokemon_v2_pokemoncolor" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspecies_growth_rate_id_fkey" FOREIGN KEY ("growth_rate_id") REFERENCES "pokemon_v2_growthrate" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspecies_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "pokemon_v2_generation" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspecies_evolution_chain_id_fkey" FOREIGN KEY ("evolution_chain_id") REFERENCES "pokemon_v2_evolutionchain" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO "new_pokemon_v2_pokemonspecies" ("base_happiness", "capture_rate", "evolution_chain_id", "evolves_from_species_id", "forms_switchable", "gender_rate", "generation_id", "growth_rate_id", "has_gender_differences", "hatch_counter", "id", "is_baby", "is_legendary", "is_mythical", "name", "order", "pokemon_color_id", "pokemon_habitat_id", "pokemon_shape_id") SELECT "base_happiness", "capture_rate", "evolution_chain_id", "evolves_from_species_id", "forms_switchable", "gender_rate", "generation_id", "growth_rate_id", "has_gender_differences", "hatch_counter", "id", "is_baby", "is_legendary", "is_mythical", "name", "order", "pokemon_color_id", "pokemon_habitat_id", "pokemon_shape_id" FROM "pokemon_v2_pokemonspecies";
DROP TABLE "pokemon_v2_pokemonspecies";
ALTER TABLE "new_pokemon_v2_pokemonspecies" RENAME TO "pokemon_v2_pokemonspecies";
CREATE INDEX "pokemon_v2_pokemonspecies_evolves_from_species_id_6e40aea2" ON "pokemon_v2_pokemonspecies"("evolves_from_species_id");
CREATE INDEX "pokemon_v2_pokemonspecies_pokemon_shape_id_9420bbbf" ON "pokemon_v2_pokemonspecies"("pokemon_shape_id");
CREATE INDEX "pokemon_v2_pokemonspecies_pokemon_habitat_id_61d7914c" ON "pokemon_v2_pokemonspecies"("pokemon_habitat_id");
CREATE INDEX "pokemon_v2_pokemonspecies_pokemon_color_id_27cb23c7" ON "pokemon_v2_pokemonspecies"("pokemon_color_id");
CREATE INDEX "pokemon_v2_pokemonspecies_growth_rate_id_78ff36e3" ON "pokemon_v2_pokemonspecies"("growth_rate_id");
CREATE INDEX "pokemon_v2_pokemonspecies_generation_id_57b5b3ef" ON "pokemon_v2_pokemonspecies"("generation_id");
CREATE INDEX "pokemon_v2_pokemonspecies_evolution_chain_id_d94981c6" ON "pokemon_v2_pokemonspecies"("evolution_chain_id");
CREATE INDEX "pokemon_v2_pokemonspecies_name_f1ec390b" ON "pokemon_v2_pokemonspecies"("name");
CREATE TABLE "new_pokemon_v2_encounterconditionvalue" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "is_default" BOOLEAN NOT NULL,
    "encounter_condition_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_encounterconditionvalue_encounter_condition_id_fkey" FOREIGN KEY ("encounter_condition_id") REFERENCES "pokemon_v2_encountercondition" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO "new_pokemon_v2_encounterconditionvalue" ("encounter_condition_id", "id", "is_default", "name") SELECT "encounter_condition_id", "id", "is_default", "name" FROM "pokemon_v2_encounterconditionvalue";
DROP TABLE "pokemon_v2_encounterconditionvalue";
ALTER TABLE "new_pokemon_v2_encounterconditionvalue" RENAME TO "pokemon_v2_encounterconditionvalue";
CREATE INDEX "pokemon_v2_encounterconditionvalue_name_fd9a9104" ON "pokemon_v2_encounterconditionvalue"("name");
CREATE INDEX "pokemon_v2_encounterconditionvalue_encounter_condition_id_e246ac97" ON "pokemon_v2_encounterconditionvalue"("encounter_condition_id");
CREATE TABLE "new_pokemon_v2_pokemonform" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "order" INTEGER,
    "is_default" BOOLEAN NOT NULL,
    "is_battle_only" BOOLEAN NOT NULL,
    "version_group_id" INTEGER,
    "pokemon_id" INTEGER,
    "is_mega" BOOLEAN NOT NULL,
    "form_order" INTEGER,
    "form_name" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_pokemonform_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon_v2_pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonform_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "pokemon_v2_versiongroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO "new_pokemon_v2_pokemonform" ("form_name", "form_order", "id", "is_battle_only", "is_default", "is_mega", "name", "order", "pokemon_id", "version_group_id") SELECT "form_name", "form_order", "id", "is_battle_only", "is_default", "is_mega", "name", "order", "pokemon_id", "version_group_id" FROM "pokemon_v2_pokemonform";
DROP TABLE "pokemon_v2_pokemonform";
ALTER TABLE "new_pokemon_v2_pokemonform" RENAME TO "pokemon_v2_pokemonform";
CREATE INDEX "pokemon_v2_pokemonform_name_fe094947" ON "pokemon_v2_pokemonform"("name");
CREATE INDEX "pokemon_v2_pokemonform_pokemon_id_f1307072" ON "pokemon_v2_pokemonform"("pokemon_id");
CREATE INDEX "pokemon_v2_pokemonform_version_group_id_88573ce7" ON "pokemon_v2_pokemonform"("version_group_id");
CREATE TABLE "new_auth_user" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "password" TEXT NOT NULL,
    "last_login" DATETIME,
    "is_superuser" BOOLEAN NOT NULL,
    "username" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "is_staff" BOOLEAN NOT NULL,
    "is_active" BOOLEAN NOT NULL,
    "date_joined" DATETIME NOT NULL,
    "first_name" TEXT NOT NULL
);
INSERT INTO "new_auth_user" ("date_joined", "email", "first_name", "id", "is_active", "is_staff", "is_superuser", "last_login", "last_name", "password", "username") SELECT "date_joined", "email", "first_name", "id", "is_active", "is_staff", "is_superuser", "last_login", "last_name", "password", "username" FROM "auth_user";
DROP TABLE "auth_user";
ALTER TABLE "new_auth_user" RENAME TO "auth_user";
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_auth_user_1" ON "auth_user"("username");
Pragma writable_schema=0;
CREATE TABLE "new_pokemon_v2_pokedex" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "is_main_series" BOOLEAN NOT NULL,
    "region_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_pokedex_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "pokemon_v2_region" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO "new_pokemon_v2_pokedex" ("id", "is_main_series", "name", "region_id") SELECT "id", "is_main_series", "name", "region_id" FROM "pokemon_v2_pokedex";
DROP TABLE "pokemon_v2_pokedex";
ALTER TABLE "new_pokemon_v2_pokedex" RENAME TO "pokemon_v2_pokedex";
CREATE INDEX "pokemon_v2_pokedex_name_d3054d11" ON "pokemon_v2_pokedex"("name");
CREATE INDEX "pokemon_v2_pokedex_region_id_d894ac3e" ON "pokemon_v2_pokedex"("region_id");
CREATE TABLE "new_pokemon_v2_pokemon" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "order" INTEGER,
    "height" INTEGER,
    "weight" INTEGER,
    "is_default" BOOLEAN NOT NULL,
    "pokemon_species_id" INTEGER,
    "base_experience" INTEGER,
    CONSTRAINT "pokemon_v2_pokemon_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_v2_pokemonspecies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO "new_pokemon_v2_pokemon" ("base_experience", "height", "id", "is_default", "name", "order", "pokemon_species_id", "weight") SELECT "base_experience", "height", "id", "is_default", "name", "order", "pokemon_species_id", "weight" FROM "pokemon_v2_pokemon";
DROP TABLE "pokemon_v2_pokemon";
ALTER TABLE "new_pokemon_v2_pokemon" RENAME TO "pokemon_v2_pokemon";
CREATE INDEX "pokemon_v2_pokemon_pokemon_species_id_e3dbafe1" ON "pokemon_v2_pokemon"("pokemon_species_id");
CREATE INDEX "pokemon_v2_pokemon_name_b4719884" ON "pokemon_v2_pokemon"("name");
CREATE TABLE "new_pokemon_v2_stat" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "is_battle_only" BOOLEAN NOT NULL,
    "game_index" INTEGER NOT NULL,
    "move_damage_class_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_stat_move_damage_class_id_fkey" FOREIGN KEY ("move_damage_class_id") REFERENCES "pokemon_v2_movedamageclass" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO "new_pokemon_v2_stat" ("game_index", "id", "is_battle_only", "move_damage_class_id", "name") SELECT "game_index", "id", "is_battle_only", "move_damage_class_id", "name" FROM "pokemon_v2_stat";
DROP TABLE "pokemon_v2_stat";
ALTER TABLE "new_pokemon_v2_stat" RENAME TO "pokemon_v2_stat";
CREATE INDEX "pokemon_v2_stat_name_abcae9af" ON "pokemon_v2_stat"("name");
CREATE INDEX "pokemon_v2_stat_move_damage_class_id_0ed19a23" ON "pokemon_v2_stat"("move_damage_class_id");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
