-- CreateTable
CREATE TABLE "auth_group" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "auth_group_permissions" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "group_id" INTEGER NOT NULL,
    "permission_id" INTEGER NOT NULL,
    CONSTRAINT "auth_group_permissions_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "auth_group_permissions_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "auth_permission" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "content_type_id" INTEGER NOT NULL,
    "codename" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    CONSTRAINT "auth_permission_content_type_id_fkey" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "auth_user" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "password" TEXT NOT NULL,
    "last_login" DATETIME,
    "is_superuser" bool NOT NULL,
    "username" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "is_staff" bool NOT NULL,
    "is_active" bool NOT NULL,
    "date_joined" DATETIME NOT NULL,
    "first_name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "auth_user_groups" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    CONSTRAINT "auth_user_groups_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "auth_user_groups_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "auth_user_user_permissions" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER NOT NULL,
    "permission_id" INTEGER NOT NULL,
    CONSTRAINT "auth_user_user_permissions_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "auth_user_user_permissions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "django_admin_log" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "action_time" DATETIME NOT NULL,
    "object_id" TEXT,
    "object_repr" TEXT NOT NULL,
    "change_message" TEXT NOT NULL,
    "content_type_id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "action_flag" smallint unsigned NOT NULL,
    CONSTRAINT "django_admin_log_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "django_admin_log_content_type_id_fkey" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "django_content_type" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "app_label" TEXT NOT NULL,
    "model" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "django_migrations" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "app" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "applied" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "django_session" (
    "session_key" TEXT NOT NULL PRIMARY KEY,
    "session_data" TEXT NOT NULL,
    "expire_date" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "django_site" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "domain" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_ability" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "is_main_series" bool NOT NULL,
    "generation_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_ability_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "pokemon_v2_generation" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_abilitychange" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "ability_id" INTEGER,
    "version_group_id" INTEGER,
    CONSTRAINT "pokemon_v2_abilitychange_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "pokemon_v2_versiongroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_abilitychange_ability_id_fkey" FOREIGN KEY ("ability_id") REFERENCES "pokemon_v2_ability" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_abilitychangeeffecttext" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "effect" TEXT NOT NULL,
    "ability_change_id" INTEGER,
    "language_id" INTEGER,
    CONSTRAINT "pokemon_v2_abilitychangeeffecttext_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_abilitychangeeffecttext_ability_change_id_fkey" FOREIGN KEY ("ability_change_id") REFERENCES "pokemon_v2_abilitychange" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_abilityeffecttext" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "effect" TEXT NOT NULL,
    "short_effect" TEXT NOT NULL,
    "ability_id" INTEGER,
    "language_id" INTEGER,
    CONSTRAINT "pokemon_v2_abilityeffecttext_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_abilityeffecttext_ability_id_fkey" FOREIGN KEY ("ability_id") REFERENCES "pokemon_v2_ability" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_abilityflavortext" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "ability_id" INTEGER,
    "language_id" INTEGER,
    "version_group_id" INTEGER,
    "flavor_text" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_abilityflavortext_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "pokemon_v2_versiongroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_abilityflavortext_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_abilityflavortext_ability_id_fkey" FOREIGN KEY ("ability_id") REFERENCES "pokemon_v2_ability" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_abilityname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "ability_id" INTEGER,
    "language_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_abilityname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_abilityname_ability_id_fkey" FOREIGN KEY ("ability_id") REFERENCES "pokemon_v2_ability" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_berry" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "natural_gift_power" INTEGER NOT NULL,
    "size" INTEGER NOT NULL,
    "max_harvest" INTEGER NOT NULL,
    "growth_time" INTEGER NOT NULL,
    "soil_dryness" INTEGER NOT NULL,
    "smoothness" INTEGER NOT NULL,
    "berry_firmness_id" INTEGER,
    "item_id" INTEGER,
    "natural_gift_type_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_berry_natural_gift_type_id_fkey" FOREIGN KEY ("natural_gift_type_id") REFERENCES "pokemon_v2_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_berry_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "pokemon_v2_item" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_berry_berry_firmness_id_fkey" FOREIGN KEY ("berry_firmness_id") REFERENCES "pokemon_v2_berryfirmness" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_berryfirmness" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_berryfirmnessname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "berry_firmness_id" INTEGER,
    "language_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_berryfirmnessname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_berryfirmnessname_berry_firmness_id_fkey" FOREIGN KEY ("berry_firmness_id") REFERENCES "pokemon_v2_berryfirmness" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_berryflavor" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "contest_type_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_berryflavor_contest_type_id_fkey" FOREIGN KEY ("contest_type_id") REFERENCES "pokemon_v2_contesttype" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_berryflavormap" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "potency" INTEGER NOT NULL,
    "berry_id" INTEGER,
    "berry_flavor_id" INTEGER,
    CONSTRAINT "pokemon_v2_berryflavormap_berry_flavor_id_fkey" FOREIGN KEY ("berry_flavor_id") REFERENCES "pokemon_v2_berryflavor" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_berryflavormap_berry_id_fkey" FOREIGN KEY ("berry_id") REFERENCES "pokemon_v2_berry" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_berryflavorname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "berry_flavor_id" INTEGER,
    "language_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_berryflavorname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_berryflavorname_berry_flavor_id_fkey" FOREIGN KEY ("berry_flavor_id") REFERENCES "pokemon_v2_berryflavor" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_characteristic" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "gene_mod_5" INTEGER NOT NULL,
    "stat_id" INTEGER,
    CONSTRAINT "pokemon_v2_characteristic_stat_id_fkey" FOREIGN KEY ("stat_id") REFERENCES "pokemon_v2_stat" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_characteristicdescription" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT NOT NULL,
    "characteristic_id" INTEGER,
    "language_id" INTEGER,
    CONSTRAINT "pokemon_v2_characteristicdescription_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_characteristicdescription_characteristic_id_fkey" FOREIGN KEY ("characteristic_id") REFERENCES "pokemon_v2_characteristic" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_contestcombo" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "first_move_id" INTEGER,
    "second_move_id" INTEGER,
    CONSTRAINT "pokemon_v2_contestcombo_second_move_id_fkey" FOREIGN KEY ("second_move_id") REFERENCES "pokemon_v2_move" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_contestcombo_first_move_id_fkey" FOREIGN KEY ("first_move_id") REFERENCES "pokemon_v2_move" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_contesteffect" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "appeal" INTEGER NOT NULL,
    "jam" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_contesteffecteffecttext" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "effect" TEXT NOT NULL,
    "contest_effect_id" INTEGER,
    "language_id" INTEGER,
    CONSTRAINT "pokemon_v2_contesteffecteffecttext_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_contesteffecteffecttext_contest_effect_id_fkey" FOREIGN KEY ("contest_effect_id") REFERENCES "pokemon_v2_contesteffect" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_contesteffectflavortext" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "flavor_text" TEXT NOT NULL,
    "contest_effect_id" INTEGER,
    "language_id" INTEGER,
    CONSTRAINT "pokemon_v2_contesteffectflavortext_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_contesteffectflavortext_contest_effect_id_fkey" FOREIGN KEY ("contest_effect_id") REFERENCES "pokemon_v2_contesteffect" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_contesttype" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_contesttypename" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "flavor" TEXT NOT NULL,
    "color" TEXT NOT NULL,
    "contest_type_id" INTEGER,
    "language_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_contesttypename_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_contesttypename_contest_type_id_fkey" FOREIGN KEY ("contest_type_id") REFERENCES "pokemon_v2_contesttype" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_egggroup" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_egggroupname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "egg_group_id" INTEGER,
    "language_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_egggroupname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_egggroupname_egg_group_id_fkey" FOREIGN KEY ("egg_group_id") REFERENCES "pokemon_v2_egggroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_encounter" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "min_level" INTEGER NOT NULL,
    "max_level" INTEGER NOT NULL,
    "location_area_id" INTEGER,
    "pokemon_id" INTEGER,
    "version_id" INTEGER,
    "encounter_slot_id" INTEGER,
    CONSTRAINT "pokemon_v2_encounter_encounter_slot_id_fkey" FOREIGN KEY ("encounter_slot_id") REFERENCES "pokemon_v2_encounterslot" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_encounter_version_id_fkey" FOREIGN KEY ("version_id") REFERENCES "pokemon_v2_version" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_encounter_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon_v2_pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_encounter_location_area_id_fkey" FOREIGN KEY ("location_area_id") REFERENCES "pokemon_v2_locationarea" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_encountercondition" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_encounterconditionname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "encounter_condition_id" INTEGER,
    "language_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_encounterconditionname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_encounterconditionname_encounter_condition_id_fkey" FOREIGN KEY ("encounter_condition_id") REFERENCES "pokemon_v2_encountercondition" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_encounterconditionvalue" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "is_default" bool NOT NULL,
    "encounter_condition_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_encounterconditionvalue_encounter_condition_id_fkey" FOREIGN KEY ("encounter_condition_id") REFERENCES "pokemon_v2_encountercondition" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_encounterconditionvaluemap" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "encounter_id" INTEGER,
    "encounter_condition_value_id" INTEGER,
    CONSTRAINT "pokemon_v2_encounterconditionvaluemap_encounter_condition_value_id_fkey" FOREIGN KEY ("encounter_condition_value_id") REFERENCES "pokemon_v2_encounterconditionvalue" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_encounterconditionvaluemap_encounter_id_fkey" FOREIGN KEY ("encounter_id") REFERENCES "pokemon_v2_encounter" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_encounterconditionvaluename" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "encounter_condition_value_id" INTEGER,
    "language_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_encounterconditionvaluename_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_encounterconditionvaluename_encounter_condition_value_id_fkey" FOREIGN KEY ("encounter_condition_value_id") REFERENCES "pokemon_v2_encounterconditionvalue" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_encountermethod" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "order" INTEGER,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_encountermethodname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "encounter_method_id" INTEGER,
    "language_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_encountermethodname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_encountermethodname_encounter_method_id_fkey" FOREIGN KEY ("encounter_method_id") REFERENCES "pokemon_v2_encountermethod" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_encounterslot" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "slot" INTEGER,
    "rarity" INTEGER NOT NULL,
    "encounter_method_id" INTEGER,
    "version_group_id" INTEGER,
    CONSTRAINT "pokemon_v2_encounterslot_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "pokemon_v2_versiongroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_encounterslot_encounter_method_id_fkey" FOREIGN KEY ("encounter_method_id") REFERENCES "pokemon_v2_encountermethod" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_evolutionchain" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "baby_trigger_item_id" INTEGER,
    CONSTRAINT "pokemon_v2_evolutionchain_baby_trigger_item_id_fkey" FOREIGN KEY ("baby_trigger_item_id") REFERENCES "pokemon_v2_item" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_evolutiontrigger" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_evolutiontriggername" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "evolution_trigger_id" INTEGER,
    "language_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_evolutiontriggername_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_evolutiontriggername_evolution_trigger_id_fkey" FOREIGN KEY ("evolution_trigger_id") REFERENCES "pokemon_v2_evolutiontrigger" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_experience" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "level" INTEGER NOT NULL,
    "experience" INTEGER NOT NULL,
    "growth_rate_id" INTEGER,
    CONSTRAINT "pokemon_v2_experience_growth_rate_id_fkey" FOREIGN KEY ("growth_rate_id") REFERENCES "pokemon_v2_growthrate" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_gender" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_generation" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "region_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_generation_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "pokemon_v2_region" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_generationname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "generation_id" INTEGER,
    "language_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_generationname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_generationname_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "pokemon_v2_generation" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_growthrate" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "formula" TEXT NOT NULL,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_growthratedescription" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "growth_rate_id" INTEGER,
    "language_id" INTEGER,
    "description" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_growthratedescription_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_growthratedescription_growth_rate_id_fkey" FOREIGN KEY ("growth_rate_id") REFERENCES "pokemon_v2_growthrate" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_item" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "cost" INTEGER,
    "fling_power" INTEGER,
    "item_category_id" INTEGER,
    "item_fling_effect_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_item_item_fling_effect_id_fkey" FOREIGN KEY ("item_fling_effect_id") REFERENCES "pokemon_v2_itemflingeffect" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_item_item_category_id_fkey" FOREIGN KEY ("item_category_id") REFERENCES "pokemon_v2_itemcategory" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_itemattribute" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_itemattributedescription" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT NOT NULL,
    "item_attribute_id" INTEGER,
    "language_id" INTEGER,
    CONSTRAINT "pokemon_v2_itemattributedescription_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_itemattributedescription_item_attribute_id_fkey" FOREIGN KEY ("item_attribute_id") REFERENCES "pokemon_v2_itemattribute" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_itemattributemap" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "item_id" INTEGER,
    "item_attribute_id" INTEGER,
    CONSTRAINT "pokemon_v2_itemattributemap_item_attribute_id_fkey" FOREIGN KEY ("item_attribute_id") REFERENCES "pokemon_v2_itemattribute" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_itemattributemap_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "pokemon_v2_item" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_itemattributename" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "item_attribute_id" INTEGER,
    "language_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_itemattributename_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_itemattributename_item_attribute_id_fkey" FOREIGN KEY ("item_attribute_id") REFERENCES "pokemon_v2_itemattribute" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_itemcategory" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "item_pocket_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_itemcategory_item_pocket_id_fkey" FOREIGN KEY ("item_pocket_id") REFERENCES "pokemon_v2_itempocket" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_itemcategoryname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "item_category_id" INTEGER,
    "language_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_itemcategoryname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_itemcategoryname_item_category_id_fkey" FOREIGN KEY ("item_category_id") REFERENCES "pokemon_v2_itemcategory" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_itemeffecttext" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "effect" TEXT NOT NULL,
    "short_effect" TEXT NOT NULL,
    "item_id" INTEGER,
    "language_id" INTEGER,
    CONSTRAINT "pokemon_v2_itemeffecttext_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_itemeffecttext_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "pokemon_v2_item" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_itemflavortext" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "flavor_text" TEXT NOT NULL,
    "item_id" INTEGER,
    "language_id" INTEGER,
    "version_group_id" INTEGER,
    CONSTRAINT "pokemon_v2_itemflavortext_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "pokemon_v2_versiongroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_itemflavortext_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_itemflavortext_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "pokemon_v2_item" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_itemflingeffect" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_itemflingeffecteffecttext" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "item_fling_effect_id" INTEGER,
    "language_id" INTEGER,
    "effect" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_itemflingeffecteffecttext_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_itemflingeffecteffecttext_item_fling_effect_id_fkey" FOREIGN KEY ("item_fling_effect_id") REFERENCES "pokemon_v2_itemflingeffect" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_itemgameindex" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "game_index" INTEGER NOT NULL,
    "generation_id" INTEGER,
    "item_id" INTEGER,
    CONSTRAINT "pokemon_v2_itemgameindex_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "pokemon_v2_item" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_itemgameindex_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "pokemon_v2_generation" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_itemname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "item_id" INTEGER,
    "language_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_itemname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_itemname_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "pokemon_v2_item" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_itempocket" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_itempocketname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "item_pocket_id" INTEGER,
    "language_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_itempocketname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_itempocketname_item_pocket_id_fkey" FOREIGN KEY ("item_pocket_id") REFERENCES "pokemon_v2_itempocket" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_itemsprites" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "item_id" INTEGER,
    "sprites" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_itemsprites_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "pokemon_v2_item" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_language" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "iso3166" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "official" bool NOT NULL,
    "order" INTEGER,
    "iso639" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_languagename" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "local_language_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_languagename_local_language_id_fkey" FOREIGN KEY ("local_language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_languagename_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_location" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "region_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_location_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "pokemon_v2_region" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_locationarea" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "game_index" INTEGER NOT NULL,
    "location_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_locationarea_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "pokemon_v2_location" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_locationareaencounterrate" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "rate" INTEGER NOT NULL,
    "location_area_id" INTEGER,
    "version_id" INTEGER,
    "encounter_method_id" INTEGER,
    CONSTRAINT "pokemon_v2_locationareaencounterrate_encounter_method_id_fkey" FOREIGN KEY ("encounter_method_id") REFERENCES "pokemon_v2_encountermethod" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_locationareaencounterrate_version_id_fkey" FOREIGN KEY ("version_id") REFERENCES "pokemon_v2_version" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_locationareaencounterrate_location_area_id_fkey" FOREIGN KEY ("location_area_id") REFERENCES "pokemon_v2_locationarea" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_locationareaname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "location_area_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_locationareaname_location_area_id_fkey" FOREIGN KEY ("location_area_id") REFERENCES "pokemon_v2_locationarea" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_locationareaname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_locationgameindex" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "game_index" INTEGER NOT NULL,
    "generation_id" INTEGER,
    "location_id" INTEGER,
    CONSTRAINT "pokemon_v2_locationgameindex_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "pokemon_v2_location" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_locationgameindex_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "pokemon_v2_generation" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_locationname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "location_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_locationname_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "pokemon_v2_location" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_locationname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_machine" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "machine_number" INTEGER NOT NULL,
    "growth_rate_id" INTEGER,
    "move_id" INTEGER,
    "version_group_id" INTEGER,
    "item_id" INTEGER,
    CONSTRAINT "pokemon_v2_machine_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "pokemon_v2_item" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_machine_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "pokemon_v2_versiongroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_machine_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "pokemon_v2_move" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_machine_growth_rate_id_fkey" FOREIGN KEY ("growth_rate_id") REFERENCES "pokemon_v2_growthrate" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_move" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "power" INTEGER,
    "pp" INTEGER,
    "accuracy" INTEGER,
    "priority" INTEGER,
    "move_effect_chance" INTEGER,
    "generation_id" INTEGER,
    "move_damage_class_id" INTEGER,
    "move_effect_id" INTEGER,
    "move_target_id" INTEGER,
    "type_id" INTEGER,
    "contest_effect_id" INTEGER,
    "contest_type_id" INTEGER,
    "super_contest_effect_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_move_super_contest_effect_id_fkey" FOREIGN KEY ("super_contest_effect_id") REFERENCES "pokemon_v2_supercontesteffect" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_move_contest_type_id_fkey" FOREIGN KEY ("contest_type_id") REFERENCES "pokemon_v2_contesttype" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_move_contest_effect_id_fkey" FOREIGN KEY ("contest_effect_id") REFERENCES "pokemon_v2_contesteffect" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_move_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "pokemon_v2_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_move_move_target_id_fkey" FOREIGN KEY ("move_target_id") REFERENCES "pokemon_v2_movetarget" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_move_move_effect_id_fkey" FOREIGN KEY ("move_effect_id") REFERENCES "pokemon_v2_moveeffect" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_move_move_damage_class_id_fkey" FOREIGN KEY ("move_damage_class_id") REFERENCES "pokemon_v2_movedamageclass" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_move_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "pokemon_v2_generation" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_moveattribute" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_moveattributedescription" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT NOT NULL,
    "language_id" INTEGER,
    "move_attribute_id" INTEGER,
    CONSTRAINT "pokemon_v2_moveattributedescription_move_attribute_id_fkey" FOREIGN KEY ("move_attribute_id") REFERENCES "pokemon_v2_moveattribute" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_moveattributedescription_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_moveattributemap" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "move_id" INTEGER,
    "move_attribute_id" INTEGER,
    CONSTRAINT "pokemon_v2_moveattributemap_move_attribute_id_fkey" FOREIGN KEY ("move_attribute_id") REFERENCES "pokemon_v2_moveattribute" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_moveattributemap_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "pokemon_v2_move" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_moveattributename" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "move_attribute_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_moveattributename_move_attribute_id_fkey" FOREIGN KEY ("move_attribute_id") REFERENCES "pokemon_v2_moveattribute" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_moveattributename_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_movebattlestyle" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_movebattlestylename" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "move_battle_style_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_movebattlestylename_move_battle_style_id_fkey" FOREIGN KEY ("move_battle_style_id") REFERENCES "pokemon_v2_movebattlestyle" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_movebattlestylename_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_movechange" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "power" INTEGER,
    "accuracy" INTEGER,
    "move_effect_chance" INTEGER,
    "move_id" INTEGER,
    "move_effect_id" INTEGER,
    "type_id" INTEGER,
    "version_group_id" INTEGER,
    "pp" INTEGER,
    CONSTRAINT "pokemon_v2_movechange_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "pokemon_v2_versiongroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_movechange_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "pokemon_v2_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_movechange_move_effect_id_fkey" FOREIGN KEY ("move_effect_id") REFERENCES "pokemon_v2_moveeffect" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_movechange_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "pokemon_v2_move" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_movedamageclass" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_movedamageclassdescription" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT NOT NULL,
    "language_id" INTEGER,
    "move_damage_class_id" INTEGER,
    CONSTRAINT "pokemon_v2_movedamageclassdescription_move_damage_class_id_fkey" FOREIGN KEY ("move_damage_class_id") REFERENCES "pokemon_v2_movedamageclass" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_movedamageclassdescription_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_movedamageclassname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "move_damage_class_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_movedamageclassname_move_damage_class_id_fkey" FOREIGN KEY ("move_damage_class_id") REFERENCES "pokemon_v2_movedamageclass" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_movedamageclassname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_moveeffect" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- CreateTable
CREATE TABLE "pokemon_v2_moveeffectchange" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "move_effect_id" INTEGER,
    "version_group_id" INTEGER,
    CONSTRAINT "pokemon_v2_moveeffectchange_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "pokemon_v2_versiongroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_moveeffectchange_move_effect_id_fkey" FOREIGN KEY ("move_effect_id") REFERENCES "pokemon_v2_moveeffect" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_moveeffectchangeeffecttext" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "effect" TEXT NOT NULL,
    "language_id" INTEGER,
    "move_effect_change_id" INTEGER,
    CONSTRAINT "pokemon_v2_moveeffectchangeeffecttext_move_effect_change_id_fkey" FOREIGN KEY ("move_effect_change_id") REFERENCES "pokemon_v2_moveeffectchange" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_moveeffectchangeeffecttext_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_moveeffecteffecttext" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "effect" TEXT NOT NULL,
    "short_effect" TEXT NOT NULL,
    "language_id" INTEGER,
    "move_effect_id" INTEGER,
    CONSTRAINT "pokemon_v2_moveeffecteffecttext_move_effect_id_fkey" FOREIGN KEY ("move_effect_id") REFERENCES "pokemon_v2_moveeffect" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_moveeffecteffecttext_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_moveflavortext" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "flavor_text" TEXT NOT NULL,
    "language_id" INTEGER,
    "move_id" INTEGER,
    "version_group_id" INTEGER,
    CONSTRAINT "pokemon_v2_moveflavortext_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "pokemon_v2_versiongroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_moveflavortext_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "pokemon_v2_move" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_moveflavortext_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_movelearnmethod" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_movelearnmethoddescription" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT NOT NULL,
    "language_id" INTEGER,
    "move_learn_method_id" INTEGER,
    CONSTRAINT "pokemon_v2_movelearnmethoddescription_move_learn_method_id_fkey" FOREIGN KEY ("move_learn_method_id") REFERENCES "pokemon_v2_movelearnmethod" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_movelearnmethoddescription_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_movelearnmethodname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "move_learn_method_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_movelearnmethodname_move_learn_method_id_fkey" FOREIGN KEY ("move_learn_method_id") REFERENCES "pokemon_v2_movelearnmethod" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_movelearnmethodname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_movemeta" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "min_hits" INTEGER,
    "max_hits" INTEGER,
    "min_turns" INTEGER,
    "max_turns" INTEGER,
    "crit_rate" INTEGER,
    "ailment_chance" INTEGER,
    "flinch_chance" INTEGER,
    "stat_chance" INTEGER,
    "move_meta_category_id" INTEGER,
    "move_id" INTEGER NOT NULL,
    "move_meta_ailment_id" INTEGER,
    "drain" INTEGER,
    "healing" INTEGER,
    CONSTRAINT "pokemon_v2_movemeta_move_meta_ailment_id_fkey" FOREIGN KEY ("move_meta_ailment_id") REFERENCES "pokemon_v2_movemetaailment" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_movemeta_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "pokemon_v2_move" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_movemeta_move_meta_category_id_fkey" FOREIGN KEY ("move_meta_category_id") REFERENCES "pokemon_v2_movemetacategory" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_movemetaailment" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_movemetaailmentname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "move_meta_ailment_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_movemetaailmentname_move_meta_ailment_id_fkey" FOREIGN KEY ("move_meta_ailment_id") REFERENCES "pokemon_v2_movemetaailment" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_movemetaailmentname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_movemetacategory" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_movemetacategorydescription" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT NOT NULL,
    "language_id" INTEGER,
    "move_meta_category_id" INTEGER,
    CONSTRAINT "pokemon_v2_movemetacategorydescription_move_meta_category_id_fkey" FOREIGN KEY ("move_meta_category_id") REFERENCES "pokemon_v2_movemetacategory" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_movemetacategorydescription_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_movemetastatchange" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "change" INTEGER NOT NULL,
    "move_id" INTEGER,
    "stat_id" INTEGER,
    CONSTRAINT "pokemon_v2_movemetastatchange_stat_id_fkey" FOREIGN KEY ("stat_id") REFERENCES "pokemon_v2_stat" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_movemetastatchange_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "pokemon_v2_move" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_movename" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "move_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_movename_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "pokemon_v2_move" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_movename_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_movetarget" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_movetargetdescription" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT NOT NULL,
    "language_id" INTEGER,
    "move_target_id" INTEGER,
    CONSTRAINT "pokemon_v2_movetargetdescription_move_target_id_fkey" FOREIGN KEY ("move_target_id") REFERENCES "pokemon_v2_movetarget" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_movetargetdescription_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_movetargetname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "move_target_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_movetargetname_move_target_id_fkey" FOREIGN KEY ("move_target_id") REFERENCES "pokemon_v2_movetarget" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_movetargetname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_nature" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "game_index" INTEGER NOT NULL,
    "decreased_stat_id" INTEGER,
    "increased_stat_id" INTEGER,
    "hates_flavor_id" INTEGER,
    "likes_flavor_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_nature_likes_flavor_id_fkey" FOREIGN KEY ("likes_flavor_id") REFERENCES "pokemon_v2_berryflavor" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_nature_hates_flavor_id_fkey" FOREIGN KEY ("hates_flavor_id") REFERENCES "pokemon_v2_berryflavor" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_nature_increased_stat_id_fkey" FOREIGN KEY ("increased_stat_id") REFERENCES "pokemon_v2_stat" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_nature_decreased_stat_id_fkey" FOREIGN KEY ("decreased_stat_id") REFERENCES "pokemon_v2_stat" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_naturebattlestylepreference" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "low_hp_preference" INTEGER NOT NULL,
    "high_hp_preference" INTEGER NOT NULL,
    "nature_id" INTEGER,
    "move_battle_style_id" INTEGER,
    CONSTRAINT "pokemon_v2_naturebattlestylepreference_move_battle_style_id_fkey" FOREIGN KEY ("move_battle_style_id") REFERENCES "pokemon_v2_movebattlestyle" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_naturebattlestylepreference_nature_id_fkey" FOREIGN KEY ("nature_id") REFERENCES "pokemon_v2_nature" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_naturename" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "nature_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_naturename_nature_id_fkey" FOREIGN KEY ("nature_id") REFERENCES "pokemon_v2_nature" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_naturename_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_naturepokeathlonstat" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "max_change" INTEGER NOT NULL,
    "nature_id" INTEGER,
    "pokeathlon_stat_id" INTEGER,
    CONSTRAINT "pokemon_v2_naturepokeathlonstat_pokeathlon_stat_id_fkey" FOREIGN KEY ("pokeathlon_stat_id") REFERENCES "pokemon_v2_pokeathlonstat" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_naturepokeathlonstat_nature_id_fkey" FOREIGN KEY ("nature_id") REFERENCES "pokemon_v2_nature" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_palpark" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "rate" INTEGER NOT NULL,
    "pal_park_area_id" INTEGER,
    "pokemon_species_id" INTEGER,
    "base_score" INTEGER,
    CONSTRAINT "pokemon_v2_palpark_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_v2_pokemonspecies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_palpark_pal_park_area_id_fkey" FOREIGN KEY ("pal_park_area_id") REFERENCES "pokemon_v2_palparkarea" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_palparkarea" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_palparkareaname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "pal_park_area_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_palparkareaname_pal_park_area_id_fkey" FOREIGN KEY ("pal_park_area_id") REFERENCES "pokemon_v2_palparkarea" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_palparkareaname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokeathlonstat" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokeathlonstatname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "pokeathlon_stat_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_pokeathlonstatname_pokeathlon_stat_id_fkey" FOREIGN KEY ("pokeathlon_stat_id") REFERENCES "pokemon_v2_pokeathlonstat" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokeathlonstatname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokedex" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "is_main_series" bool NOT NULL,
    "region_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_pokedex_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "pokemon_v2_region" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokedexdescription" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT NOT NULL,
    "language_id" INTEGER,
    "pokedex_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokedexdescription_pokedex_id_fkey" FOREIGN KEY ("pokedex_id") REFERENCES "pokemon_v2_pokedex" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokedexdescription_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokedexname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "pokedex_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_pokedexname_pokedex_id_fkey" FOREIGN KEY ("pokedex_id") REFERENCES "pokemon_v2_pokedex" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokedexname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokedexversiongroup" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "pokedex_id" INTEGER,
    "version_group_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokedexversiongroup_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "pokemon_v2_versiongroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokedexversiongroup_pokedex_id_fkey" FOREIGN KEY ("pokedex_id") REFERENCES "pokemon_v2_pokedex" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemon" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "order" INTEGER,
    "height" INTEGER,
    "weight" INTEGER,
    "is_default" bool NOT NULL,
    "pokemon_species_id" INTEGER,
    "base_experience" INTEGER,
    CONSTRAINT "pokemon_v2_pokemon_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_v2_pokemonspecies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonability" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "is_hidden" bool NOT NULL,
    "slot" INTEGER NOT NULL,
    "ability_id" INTEGER,
    "pokemon_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemonability_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon_v2_pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonability_ability_id_fkey" FOREIGN KEY ("ability_id") REFERENCES "pokemon_v2_ability" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonabilitypast" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "is_hidden" bool NOT NULL,
    "slot" INTEGER NOT NULL,
    "ability_id" INTEGER,
    "generation_id" INTEGER,
    "pokemon_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemonabilitypast_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon_v2_pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonabilitypast_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "pokemon_v2_generation" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonabilitypast_ability_id_fkey" FOREIGN KEY ("ability_id") REFERENCES "pokemon_v2_ability" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemoncolor" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemoncolorname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "pokemon_color_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_pokemoncolorname_pokemon_color_id_fkey" FOREIGN KEY ("pokemon_color_id") REFERENCES "pokemon_v2_pokemoncolor" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemoncolorname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemoncries" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "cries" TEXT NOT NULL,
    "pokemon_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemoncries_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon_v2_pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemondexnumber" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "pokedex_number" INTEGER NOT NULL,
    "pokedex_id" INTEGER,
    "pokemon_species_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemondexnumber_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_v2_pokemonspecies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemondexnumber_pokedex_id_fkey" FOREIGN KEY ("pokedex_id") REFERENCES "pokemon_v2_pokedex" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonegggroup" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "egg_group_id" INTEGER,
    "pokemon_species_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemonegggroup_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_v2_pokemonspecies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonegggroup_egg_group_id_fkey" FOREIGN KEY ("egg_group_id") REFERENCES "pokemon_v2_egggroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonevolution" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "min_level" INTEGER,
    "time_of_day" TEXT,
    "min_happiness" INTEGER,
    "min_affection" INTEGER,
    "relative_physical_stats" INTEGER,
    "needs_overworld_rain" bool NOT NULL,
    "turn_upside_down" bool NOT NULL,
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
    CONSTRAINT "pokemon_v2_pokemonevolution_evolution_trigger_id_fkey" FOREIGN KEY ("evolution_trigger_id") REFERENCES "pokemon_v2_evolutiontrigger" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonform" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "order" INTEGER,
    "is_default" bool NOT NULL,
    "is_battle_only" bool NOT NULL,
    "version_group_id" INTEGER,
    "pokemon_id" INTEGER,
    "is_mega" bool NOT NULL,
    "form_order" INTEGER,
    "form_name" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_pokemonform_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon_v2_pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonform_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "pokemon_v2_versiongroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonformgeneration" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "game_index" INTEGER NOT NULL,
    "generation_id" INTEGER,
    "pokemon_form_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemonformgeneration_pokemon_form_id_fkey" FOREIGN KEY ("pokemon_form_id") REFERENCES "pokemon_v2_pokemonform" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonformgeneration_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "pokemon_v2_generation" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonformname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "language_id" INTEGER,
    "pokemon_form_id" INTEGER,
    "pokemon_name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_pokemonformname_pokemon_form_id_fkey" FOREIGN KEY ("pokemon_form_id") REFERENCES "pokemon_v2_pokemonform" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonformname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonformsprites" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "pokemon_form_id" INTEGER,
    "sprites" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_pokemonformsprites_pokemon_form_id_fkey" FOREIGN KEY ("pokemon_form_id") REFERENCES "pokemon_v2_pokemonform" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonformtype" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "slot" INTEGER NOT NULL,
    "pokemon_form_id" INTEGER,
    "type_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemonformtype_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "pokemon_v2_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonformtype_pokemon_form_id_fkey" FOREIGN KEY ("pokemon_form_id") REFERENCES "pokemon_v2_pokemonform" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemongameindex" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "game_index" INTEGER NOT NULL,
    "pokemon_id" INTEGER,
    "version_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemongameindex_version_id_fkey" FOREIGN KEY ("version_id") REFERENCES "pokemon_v2_version" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemongameindex_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon_v2_pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonhabitat" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonhabitatname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "pokemon_habitat_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_pokemonhabitatname_pokemon_habitat_id_fkey" FOREIGN KEY ("pokemon_habitat_id") REFERENCES "pokemon_v2_pokemonhabitat" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonhabitatname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonitem" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "rarity" INTEGER NOT NULL,
    "pokemon_id" INTEGER,
    "version_id" INTEGER,
    "item_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemonitem_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "pokemon_v2_item" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonitem_version_id_fkey" FOREIGN KEY ("version_id") REFERENCES "pokemon_v2_version" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonitem_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon_v2_pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonmove" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "order" INTEGER,
    "level" INTEGER NOT NULL,
    "move_id" INTEGER,
    "pokemon_id" INTEGER,
    "version_group_id" INTEGER,
    "move_learn_method_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemonmove_move_learn_method_id_fkey" FOREIGN KEY ("move_learn_method_id") REFERENCES "pokemon_v2_movelearnmethod" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonmove_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "pokemon_v2_versiongroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonmove_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon_v2_pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonmove_move_id_fkey" FOREIGN KEY ("move_id") REFERENCES "pokemon_v2_move" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonshape" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonshapename" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "awesome_name" TEXT NOT NULL,
    "language_id" INTEGER,
    "pokemon_shape_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_pokemonshapename_pokemon_shape_id_fkey" FOREIGN KEY ("pokemon_shape_id") REFERENCES "pokemon_v2_pokemonshape" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonshapename_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonspecies" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "order" INTEGER,
    "gender_rate" INTEGER,
    "capture_rate" INTEGER,
    "base_happiness" INTEGER,
    "is_baby" bool NOT NULL,
    "hatch_counter" INTEGER,
    "has_gender_differences" bool NOT NULL,
    "forms_switchable" bool NOT NULL,
    "evolution_chain_id" INTEGER,
    "generation_id" INTEGER,
    "growth_rate_id" INTEGER,
    "pokemon_color_id" INTEGER,
    "pokemon_habitat_id" INTEGER,
    "pokemon_shape_id" INTEGER,
    "is_legendary" bool NOT NULL,
    "is_mythical" bool NOT NULL,
    "evolves_from_species_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemonspecies_evolves_from_species_id_fkey" FOREIGN KEY ("evolves_from_species_id") REFERENCES "pokemon_v2_pokemonspecies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspecies_pokemon_shape_id_fkey" FOREIGN KEY ("pokemon_shape_id") REFERENCES "pokemon_v2_pokemonshape" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspecies_pokemon_habitat_id_fkey" FOREIGN KEY ("pokemon_habitat_id") REFERENCES "pokemon_v2_pokemonhabitat" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspecies_pokemon_color_id_fkey" FOREIGN KEY ("pokemon_color_id") REFERENCES "pokemon_v2_pokemoncolor" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspecies_growth_rate_id_fkey" FOREIGN KEY ("growth_rate_id") REFERENCES "pokemon_v2_growthrate" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspecies_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "pokemon_v2_generation" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspecies_evolution_chain_id_fkey" FOREIGN KEY ("evolution_chain_id") REFERENCES "pokemon_v2_evolutionchain" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonspeciesdescription" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT NOT NULL,
    "language_id" INTEGER,
    "pokemon_species_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemonspeciesdescription_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_v2_pokemonspecies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspeciesdescription_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonspeciesflavortext" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "flavor_text" TEXT NOT NULL,
    "language_id" INTEGER,
    "pokemon_species_id" INTEGER,
    "version_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemonspeciesflavortext_version_id_fkey" FOREIGN KEY ("version_id") REFERENCES "pokemon_v2_version" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspeciesflavortext_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_v2_pokemonspecies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspeciesflavortext_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonspeciesname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "genus" TEXT NOT NULL,
    "language_id" INTEGER,
    "pokemon_species_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_pokemonspeciesname_pokemon_species_id_fkey" FOREIGN KEY ("pokemon_species_id") REFERENCES "pokemon_v2_pokemonspecies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonspeciesname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonsprites" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "pokemon_id" INTEGER,
    "sprites" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_pokemonsprites_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon_v2_pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemonstat" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "base_stat" INTEGER NOT NULL,
    "effort" INTEGER NOT NULL,
    "pokemon_id" INTEGER,
    "stat_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemonstat_stat_id_fkey" FOREIGN KEY ("stat_id") REFERENCES "pokemon_v2_stat" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemonstat_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon_v2_pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemontype" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "slot" INTEGER NOT NULL,
    "pokemon_id" INTEGER,
    "type_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemontype_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "pokemon_v2_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemontype_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon_v2_pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_pokemontypepast" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "slot" INTEGER NOT NULL,
    "generation_id" INTEGER,
    "pokemon_id" INTEGER,
    "type_id" INTEGER,
    CONSTRAINT "pokemon_v2_pokemontypepast_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "pokemon_v2_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemontypepast_pokemon_id_fkey" FOREIGN KEY ("pokemon_id") REFERENCES "pokemon_v2_pokemon" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_pokemontypepast_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "pokemon_v2_generation" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_region" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_regionname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "region_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_regionname_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "pokemon_v2_region" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_regionname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_stat" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "is_battle_only" bool NOT NULL,
    "game_index" INTEGER NOT NULL,
    "move_damage_class_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_stat_move_damage_class_id_fkey" FOREIGN KEY ("move_damage_class_id") REFERENCES "pokemon_v2_movedamageclass" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_statname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "stat_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_statname_stat_id_fkey" FOREIGN KEY ("stat_id") REFERENCES "pokemon_v2_stat" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_statname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_supercontestcombo" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "first_move_id" INTEGER,
    "second_move_id" INTEGER,
    CONSTRAINT "pokemon_v2_supercontestcombo_second_move_id_fkey" FOREIGN KEY ("second_move_id") REFERENCES "pokemon_v2_move" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_supercontestcombo_first_move_id_fkey" FOREIGN KEY ("first_move_id") REFERENCES "pokemon_v2_move" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_supercontesteffect" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "appeal" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "pokemon_v2_supercontesteffectflavortext" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "flavor_text" TEXT NOT NULL,
    "language_id" INTEGER,
    "super_contest_effect_id" INTEGER,
    CONSTRAINT "pokemon_v2_supercontesteffectflavortext_super_contest_effect_id_fkey" FOREIGN KEY ("super_contest_effect_id") REFERENCES "pokemon_v2_supercontesteffect" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_supercontesteffectflavortext_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_type" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "generation_id" INTEGER,
    "move_damage_class_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_type_move_damage_class_id_fkey" FOREIGN KEY ("move_damage_class_id") REFERENCES "pokemon_v2_movedamageclass" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_type_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "pokemon_v2_generation" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_typeefficacy" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "damage_factor" INTEGER NOT NULL,
    "damage_type_id" INTEGER,
    "target_type_id" INTEGER,
    CONSTRAINT "pokemon_v2_typeefficacy_target_type_id_fkey" FOREIGN KEY ("target_type_id") REFERENCES "pokemon_v2_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_typeefficacy_damage_type_id_fkey" FOREIGN KEY ("damage_type_id") REFERENCES "pokemon_v2_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_typeefficacypast" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "damage_factor" INTEGER NOT NULL,
    "damage_type_id" INTEGER,
    "generation_id" INTEGER,
    "target_type_id" INTEGER,
    CONSTRAINT "pokemon_v2_typeefficacypast_target_type_id_fkey" FOREIGN KEY ("target_type_id") REFERENCES "pokemon_v2_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_typeefficacypast_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "pokemon_v2_generation" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_typeefficacypast_damage_type_id_fkey" FOREIGN KEY ("damage_type_id") REFERENCES "pokemon_v2_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_typegameindex" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "game_index" INTEGER NOT NULL,
    "generation_id" INTEGER,
    "type_id" INTEGER,
    CONSTRAINT "pokemon_v2_typegameindex_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "pokemon_v2_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_typegameindex_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "pokemon_v2_generation" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_typename" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "type_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_typename_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "pokemon_v2_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_typename_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_version" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "version_group_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_version_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "pokemon_v2_versiongroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_versiongroup" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "order" INTEGER,
    "generation_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_versiongroup_generation_id_fkey" FOREIGN KEY ("generation_id") REFERENCES "pokemon_v2_generation" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_versiongroupmovelearnmethod" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "move_learn_method_id" INTEGER,
    "version_group_id" INTEGER,
    CONSTRAINT "pokemon_v2_versiongroupmovelearnmethod_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "pokemon_v2_versiongroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_versiongroupmovelearnmethod_move_learn_method_id_fkey" FOREIGN KEY ("move_learn_method_id") REFERENCES "pokemon_v2_movelearnmethod" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_versiongroupregion" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "version_group_id" INTEGER,
    "region_id" INTEGER,
    CONSTRAINT "pokemon_v2_versiongroupregion_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "pokemon_v2_region" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_versiongroupregion_version_group_id_fkey" FOREIGN KEY ("version_group_id") REFERENCES "pokemon_v2_versiongroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "pokemon_v2_versionname" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER,
    "version_id" INTEGER,
    "name" TEXT NOT NULL,
    CONSTRAINT "pokemon_v2_versionname_version_id_fkey" FOREIGN KEY ("version_id") REFERENCES "pokemon_v2_version" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "pokemon_v2_versionname_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "pokemon_v2_language" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_auth_group_1" ON "auth_group"("name");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions"("permission_id");

-- CreateIndex
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions"("group_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions"("group_id", "permission_id");

-- CreateIndex
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission"("content_type_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission"("content_type_id", "codename");

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_auth_user_1" ON "auth_user"("username");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups"("group_id");

-- CreateIndex
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups"("user_id", "group_id");

-- CreateIndex
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions"("permission_id");

-- CreateIndex
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions"("user_id", "permission_id");

-- CreateIndex
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log"("user_id");

-- CreateIndex
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log"("content_type_id");

-- CreateIndex
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type"("app_label", "model");

-- CreateIndex
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session"("expire_date");

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_django_site_1" ON "django_site"("domain");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "pokemon_v2_ability_name_744d1800" ON "pokemon_v2_ability"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_ability_generation_id_225aa68a" ON "pokemon_v2_ability"("generation_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_abilitychange_version_group_id_04bcdf19" ON "pokemon_v2_abilitychange"("version_group_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_abilitychange_ability_id_b263505f" ON "pokemon_v2_abilitychange"("ability_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_abilitychangeeffecttext_language_id_ed14bf34" ON "pokemon_v2_abilitychangeeffecttext"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_abilitychangeeffecttext_ability_change_id_7b10479d" ON "pokemon_v2_abilitychangeeffecttext"("ability_change_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_abilityeffecttext_language_id_9a3fc9eb" ON "pokemon_v2_abilityeffecttext"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_abilityeffecttext_ability_id_9fe65f70" ON "pokemon_v2_abilityeffecttext"("ability_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_abilityflavortext_version_group_id_a379dd5d" ON "pokemon_v2_abilityflavortext"("version_group_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_abilityflavortext_language_id_91dfb962" ON "pokemon_v2_abilityflavortext"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_abilityflavortext_ability_id_8c20d4bf" ON "pokemon_v2_abilityflavortext"("ability_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_abilityname_name_8db2ae39" ON "pokemon_v2_abilityname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_abilityname_language_id_e64c37fb" ON "pokemon_v2_abilityname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_abilityname_ability_id_2753864d" ON "pokemon_v2_abilityname"("ability_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_berry_name_4eaa4d0f" ON "pokemon_v2_berry"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_berry_natural_gift_type_id_7d76f035" ON "pokemon_v2_berry"("natural_gift_type_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_berry_item_id_72a1ed81" ON "pokemon_v2_berry"("item_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_berry_berry_firmness_id_780e6268" ON "pokemon_v2_berry"("berry_firmness_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_berryfirmness_name_13b8b31d" ON "pokemon_v2_berryfirmness"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_berryfirmnessname_name_2a74382f" ON "pokemon_v2_berryfirmnessname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_berryfirmnessname_language_id_7e7f395e" ON "pokemon_v2_berryfirmnessname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_berryfirmnessname_berry_firmness_id_905d4dcf" ON "pokemon_v2_berryfirmnessname"("berry_firmness_id");

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_pokemon_v2_berryflavor_1" ON "pokemon_v2_berryflavor"("contest_type_id");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "pokemon_v2_berryflavor_name_b33ebfb3" ON "pokemon_v2_berryflavor"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_berryflavormap_berry_flavor_id_65cf6f73" ON "pokemon_v2_berryflavormap"("berry_flavor_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_berryflavormap_berry_id_e4a753e4" ON "pokemon_v2_berryflavormap"("berry_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_berryflavorname_name_c499b01c" ON "pokemon_v2_berryflavorname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_berryflavorname_language_id_fa96a7af" ON "pokemon_v2_berryflavorname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_berryflavorname_berry_flavor_id_1dd899da" ON "pokemon_v2_berryflavorname"("berry_flavor_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_characteristic_stat_id_cf62870d" ON "pokemon_v2_characteristic"("stat_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_characteristicdescription_language_id_48d9a020" ON "pokemon_v2_characteristicdescription"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_characteristicdescription_characteristic_id_a943ddcf" ON "pokemon_v2_characteristicdescription"("characteristic_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_contestcombo_second_move_id_5bf6f920" ON "pokemon_v2_contestcombo"("second_move_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_contestcombo_first_move_id_e86fe950" ON "pokemon_v2_contestcombo"("first_move_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_contesteffecteffecttext_language_id_0e98da56" ON "pokemon_v2_contesteffecteffecttext"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_contesteffecteffecttext_contest_effect_id_523f86e5" ON "pokemon_v2_contesteffecteffecttext"("contest_effect_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_contesteffectflavortext_language_id_a584e527" ON "pokemon_v2_contesteffectflavortext"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_contesteffectflavortext_contest_effect_id_73bd43b4" ON "pokemon_v2_contesteffectflavortext"("contest_effect_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_contesttype_name_18e75f76" ON "pokemon_v2_contesttype"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_contesttypename_name_270b053a" ON "pokemon_v2_contesttypename"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_contesttypename_language_id_2113d494" ON "pokemon_v2_contesttypename"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_contesttypename_contest_type_id_08e7cb9d" ON "pokemon_v2_contesttypename"("contest_type_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_egggroup_name_452dc3a4" ON "pokemon_v2_egggroup"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_egggroupname_name_4ae8920c" ON "pokemon_v2_egggroupname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_egggroupname_language_id_b233cbf3" ON "pokemon_v2_egggroupname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_egggroupname_egg_group_id_0e05a091" ON "pokemon_v2_egggroupname"("egg_group_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_encounter_encounter_slot_id_67f269af" ON "pokemon_v2_encounter"("encounter_slot_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_encounter_version_id_46932476" ON "pokemon_v2_encounter"("version_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_encounter_pokemon_id_a4a76f85" ON "pokemon_v2_encounter"("pokemon_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_encounter_location_area_id_fa408e67" ON "pokemon_v2_encounter"("location_area_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_encountercondition_name_6825a841" ON "pokemon_v2_encountercondition"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_encounterconditionname_name_9140f29e" ON "pokemon_v2_encounterconditionname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_encounterconditionname_language_id_15462dd7" ON "pokemon_v2_encounterconditionname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_encounterconditionname_encounter_condition_id_07da9a9c" ON "pokemon_v2_encounterconditionname"("encounter_condition_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_encounterconditionvalue_name_fd9a9104" ON "pokemon_v2_encounterconditionvalue"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_encounterconditionvalue_encounter_condition_id_e246ac97" ON "pokemon_v2_encounterconditionvalue"("encounter_condition_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_encounterconditionvaluemap_encounter_condition_value_id_aea7c219" ON "pokemon_v2_encounterconditionvaluemap"("encounter_condition_value_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_encounterconditionvaluemap_encounter_id_07cf7d14" ON "pokemon_v2_encounterconditionvaluemap"("encounter_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_encounterconditionvaluename_name_09aada74" ON "pokemon_v2_encounterconditionvaluename"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_encounterconditionvaluename_language_id_759f2aa7" ON "pokemon_v2_encounterconditionvaluename"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_encounterconditionvaluename_encounter_condition_value_id_30a8cc50" ON "pokemon_v2_encounterconditionvaluename"("encounter_condition_value_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_encountermethod_name_807a7363" ON "pokemon_v2_encountermethod"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_encountermethodname_name_c50b0da6" ON "pokemon_v2_encountermethodname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_encountermethodname_language_id_df10978f" ON "pokemon_v2_encountermethodname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_encountermethodname_encounter_method_id_f0b81197" ON "pokemon_v2_encountermethodname"("encounter_method_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_encounterslot_version_group_id_de2e9658" ON "pokemon_v2_encounterslot"("version_group_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_encounterslot_encounter_method_id_b9a4d963" ON "pokemon_v2_encounterslot"("encounter_method_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_evolutionchain_baby_trigger_item_id_8341ae6a" ON "pokemon_v2_evolutionchain"("baby_trigger_item_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_evolutiontrigger_name_5e94bd81" ON "pokemon_v2_evolutiontrigger"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_evolutiontriggername_name_8119ef67" ON "pokemon_v2_evolutiontriggername"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_evolutiontriggername_language_id_9a05e0c7" ON "pokemon_v2_evolutiontriggername"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_evolutiontriggername_evolution_trigger_id_9d66b90d" ON "pokemon_v2_evolutiontriggername"("evolution_trigger_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_experience_growth_rate_id_42dcd743" ON "pokemon_v2_experience"("growth_rate_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_gender_name_40507af4" ON "pokemon_v2_gender"("name");

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_pokemon_v2_generation_1" ON "pokemon_v2_generation"("region_id");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "pokemon_v2_generation_name_6e9940f4" ON "pokemon_v2_generation"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_generationname_name_f79c2051" ON "pokemon_v2_generationname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_generationname_language_id_4e855215" ON "pokemon_v2_generationname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_generationname_generation_id_9f22cdbb" ON "pokemon_v2_generationname"("generation_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_growthrate_name_1926e11a" ON "pokemon_v2_growthrate"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_growthratedescription_language_id_5bbe9b57" ON "pokemon_v2_growthratedescription"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_growthratedescription_growth_rate_id_2e126dd5" ON "pokemon_v2_growthratedescription"("growth_rate_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_item_name_5597f95e" ON "pokemon_v2_item"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_item_item_fling_effect_id_8e7cefaa" ON "pokemon_v2_item"("item_fling_effect_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_item_item_category_id_9f55b7ca" ON "pokemon_v2_item"("item_category_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemattribute_name_7e365d21" ON "pokemon_v2_itemattribute"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemattributedescription_language_id_5385b04c" ON "pokemon_v2_itemattributedescription"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemattributedescription_item_attribute_id_cdd96fff" ON "pokemon_v2_itemattributedescription"("item_attribute_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemattributemap_item_attribute_id_e6cd252f" ON "pokemon_v2_itemattributemap"("item_attribute_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemattributemap_item_id_e6dba1a6" ON "pokemon_v2_itemattributemap"("item_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemattributename_name_3e2ccd4a" ON "pokemon_v2_itemattributename"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemattributename_language_id_e36a7fe1" ON "pokemon_v2_itemattributename"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemattributename_item_attribute_id_85acc7f5" ON "pokemon_v2_itemattributename"("item_attribute_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemcategory_name_54594288" ON "pokemon_v2_itemcategory"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemcategory_item_pocket_id_8ebf7645" ON "pokemon_v2_itemcategory"("item_pocket_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemcategoryname_name_b0889e22" ON "pokemon_v2_itemcategoryname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemcategoryname_language_id_6a5424db" ON "pokemon_v2_itemcategoryname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemcategoryname_item_category_id_10412a45" ON "pokemon_v2_itemcategoryname"("item_category_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemeffecttext_language_id_53e95659" ON "pokemon_v2_itemeffecttext"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemeffecttext_item_id_2fb7601c" ON "pokemon_v2_itemeffecttext"("item_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemflavortext_version_group_id_20b07485" ON "pokemon_v2_itemflavortext"("version_group_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemflavortext_language_id_dee91cde" ON "pokemon_v2_itemflavortext"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemflavortext_item_id_f2575960" ON "pokemon_v2_itemflavortext"("item_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemflingeffect_name_bcd91c57" ON "pokemon_v2_itemflingeffect"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemflingeffecteffecttext_language_id_7c369333" ON "pokemon_v2_itemflingeffecteffecttext"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemflingeffecteffecttext_item_fling_effect_id_31f3ddda" ON "pokemon_v2_itemflingeffecteffecttext"("item_fling_effect_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemgameindex_item_id_518e20fd" ON "pokemon_v2_itemgameindex"("item_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemgameindex_generation_id_a182ee37" ON "pokemon_v2_itemgameindex"("generation_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemname_name_4b3fc446" ON "pokemon_v2_itemname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemname_language_id_69bf5660" ON "pokemon_v2_itemname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemname_item_id_cf942d90" ON "pokemon_v2_itemname"("item_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itempocket_name_d30e337a" ON "pokemon_v2_itempocket"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_itempocketname_name_c3e53fd6" ON "pokemon_v2_itempocketname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_itempocketname_language_id_bd18485d" ON "pokemon_v2_itempocketname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itempocketname_item_pocket_id_2856f7ba" ON "pokemon_v2_itempocketname"("item_pocket_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_itemsprites_item_id_ad42d3ae" ON "pokemon_v2_itemsprites"("item_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_language_name_012b2a8c" ON "pokemon_v2_language"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_languagename_name_6597eeaa" ON "pokemon_v2_languagename"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_languagename_local_language_id_b09a9c7d" ON "pokemon_v2_languagename"("local_language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_languagename_language_id_75856281" ON "pokemon_v2_languagename"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_location_name_09fe9462" ON "pokemon_v2_location"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_location_region_id_fd1b5904" ON "pokemon_v2_location"("region_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_locationarea_name_8b427914" ON "pokemon_v2_locationarea"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_locationarea_location_id_a62c4737" ON "pokemon_v2_locationarea"("location_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_locationareaencounterrate_encounter_method_id_631902d6" ON "pokemon_v2_locationareaencounterrate"("encounter_method_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_locationareaencounterrate_version_id_67e1bbb9" ON "pokemon_v2_locationareaencounterrate"("version_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_locationareaencounterrate_location_area_id_78fab47d" ON "pokemon_v2_locationareaencounterrate"("location_area_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_locationareaname_name_36edcff1" ON "pokemon_v2_locationareaname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_locationareaname_location_area_id_99f07edf" ON "pokemon_v2_locationareaname"("location_area_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_locationareaname_language_id_82f198e4" ON "pokemon_v2_locationareaname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_locationgameindex_location_id_4eadd886" ON "pokemon_v2_locationgameindex"("location_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_locationgameindex_generation_id_15ae87aa" ON "pokemon_v2_locationgameindex"("generation_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_locationname_name_0dc028d2" ON "pokemon_v2_locationname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_locationname_location_id_b4de5b51" ON "pokemon_v2_locationname"("location_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_locationname_language_id_9c042035" ON "pokemon_v2_locationname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_machine_item_id_4c870846" ON "pokemon_v2_machine"("item_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_machine_version_group_id_d69b6064" ON "pokemon_v2_machine"("version_group_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_machine_move_id_965a6a38" ON "pokemon_v2_machine"("move_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_machine_growth_rate_id_d67448d0" ON "pokemon_v2_machine"("growth_rate_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_move_name_b3558818" ON "pokemon_v2_move"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_move_super_contest_effect_id_c0efdaf5" ON "pokemon_v2_move"("super_contest_effect_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_move_contest_type_id_8da106eb" ON "pokemon_v2_move"("contest_type_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_move_contest_effect_id_2e4d04a1" ON "pokemon_v2_move"("contest_effect_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_move_type_id_a2b25a4c" ON "pokemon_v2_move"("type_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_move_move_target_id_47f917eb" ON "pokemon_v2_move"("move_target_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_move_move_effect_id_e12d5c62" ON "pokemon_v2_move"("move_effect_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_move_move_damage_class_id_6f60c380" ON "pokemon_v2_move"("move_damage_class_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_move_generation_id_d18da2f9" ON "pokemon_v2_move"("generation_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_moveattribute_name_3a5f5200" ON "pokemon_v2_moveattribute"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_moveattributedescription_move_attribute_id_26fa4593" ON "pokemon_v2_moveattributedescription"("move_attribute_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_moveattributedescription_language_id_3cc96a2c" ON "pokemon_v2_moveattributedescription"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_moveattributemap_move_attribute_id_4bdcbae4" ON "pokemon_v2_moveattributemap"("move_attribute_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_moveattributemap_move_id_8e9353e9" ON "pokemon_v2_moveattributemap"("move_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_moveattributename_name_9d7c4e1e" ON "pokemon_v2_moveattributename"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_moveattributename_move_attribute_id_06b2d536" ON "pokemon_v2_moveattributename"("move_attribute_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_moveattributename_language_id_f0fdbb0e" ON "pokemon_v2_moveattributename"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movebattlestyle_name_0257848e" ON "pokemon_v2_movebattlestyle"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_movebattlestylename_name_4470754a" ON "pokemon_v2_movebattlestylename"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_movebattlestylename_move_battle_style_id_0216e7a5" ON "pokemon_v2_movebattlestylename"("move_battle_style_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movebattlestylename_language_id_6dd407cd" ON "pokemon_v2_movebattlestylename"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movechange_version_group_id_d98e7e4b" ON "pokemon_v2_movechange"("version_group_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movechange_type_id_07064588" ON "pokemon_v2_movechange"("type_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movechange_move_effect_id_d0711cd2" ON "pokemon_v2_movechange"("move_effect_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movechange_move_id_56b40d0f" ON "pokemon_v2_movechange"("move_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movedamageclass_name_8c1669d6" ON "pokemon_v2_movedamageclass"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_movedamageclassdescription_move_damage_class_id_4624e8c3" ON "pokemon_v2_movedamageclassdescription"("move_damage_class_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movedamageclassdescription_language_id_984a7058" ON "pokemon_v2_movedamageclassdescription"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movedamageclassname_name_e38f4f0f" ON "pokemon_v2_movedamageclassname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_movedamageclassname_move_damage_class_id_8d041412" ON "pokemon_v2_movedamageclassname"("move_damage_class_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movedamageclassname_language_id_b66d9a02" ON "pokemon_v2_movedamageclassname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_moveeffectchange_version_group_id_ad5675d0" ON "pokemon_v2_moveeffectchange"("version_group_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_moveeffectchange_move_effect_id_83bb0e24" ON "pokemon_v2_moveeffectchange"("move_effect_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_moveeffectchangeeffecttext_move_effect_change_id_c4e6b8f2" ON "pokemon_v2_moveeffectchangeeffecttext"("move_effect_change_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_moveeffectchangeeffecttext_language_id_f616622c" ON "pokemon_v2_moveeffectchangeeffecttext"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_moveeffecteffecttext_move_effect_id_e834153e" ON "pokemon_v2_moveeffecteffecttext"("move_effect_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_moveeffecteffecttext_language_id_4e202686" ON "pokemon_v2_moveeffecteffecttext"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_moveflavortext_version_group_id_acb46240" ON "pokemon_v2_moveflavortext"("version_group_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_moveflavortext_move_id_e694b553" ON "pokemon_v2_moveflavortext"("move_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_moveflavortext_language_id_cad665e7" ON "pokemon_v2_moveflavortext"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movelearnmethod_name_d6294fe9" ON "pokemon_v2_movelearnmethod"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_movelearnmethoddescription_move_learn_method_id_09ec6a7b" ON "pokemon_v2_movelearnmethoddescription"("move_learn_method_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movelearnmethoddescription_language_id_a6bac991" ON "pokemon_v2_movelearnmethoddescription"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movelearnmethodname_name_b665e82d" ON "pokemon_v2_movelearnmethodname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_movelearnmethodname_move_learn_method_id_04b9abfa" ON "pokemon_v2_movelearnmethodname"("move_learn_method_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movelearnmethodname_language_id_aa17010f" ON "pokemon_v2_movelearnmethodname"("language_id");

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_pokemon_v2_movemeta_1" ON "pokemon_v2_movemeta"("move_id");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "pokemon_v2_movemeta_move_meta_ailment_id_d261d5e1" ON "pokemon_v2_movemeta"("move_meta_ailment_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movemeta_move_meta_category_id_5fc2f4b6" ON "pokemon_v2_movemeta"("move_meta_category_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movemetaailment_name_7e8b85b0" ON "pokemon_v2_movemetaailment"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_movemetaailmentname_name_a286e4d0" ON "pokemon_v2_movemetaailmentname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_movemetaailmentname_move_meta_ailment_id_3166201a" ON "pokemon_v2_movemetaailmentname"("move_meta_ailment_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movemetaailmentname_language_id_c536b83b" ON "pokemon_v2_movemetaailmentname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movemetacategory_name_2d508cb0" ON "pokemon_v2_movemetacategory"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_movemetacategorydescription_move_meta_category_id_4b604073" ON "pokemon_v2_movemetacategorydescription"("move_meta_category_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movemetacategorydescription_language_id_feacc726" ON "pokemon_v2_movemetacategorydescription"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movemetastatchange_stat_id_7bbd0200" ON "pokemon_v2_movemetastatchange"("stat_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movemetastatchange_move_id_b8528bde" ON "pokemon_v2_movemetastatchange"("move_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movename_name_8f60338a" ON "pokemon_v2_movename"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_movename_move_id_f28e6bef" ON "pokemon_v2_movename"("move_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movename_language_id_9c478512" ON "pokemon_v2_movename"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movetarget_name_af0c75ad" ON "pokemon_v2_movetarget"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_movetargetdescription_move_target_id_1afb9b51" ON "pokemon_v2_movetargetdescription"("move_target_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movetargetdescription_language_id_85ac7390" ON "pokemon_v2_movetargetdescription"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movetargetname_name_ae888d7a" ON "pokemon_v2_movetargetname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_movetargetname_move_target_id_61f56365" ON "pokemon_v2_movetargetname"("move_target_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_movetargetname_language_id_05d3b8b8" ON "pokemon_v2_movetargetname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_nature_name_a7f453b0" ON "pokemon_v2_nature"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_nature_likes_flavor_id_475f0a7d" ON "pokemon_v2_nature"("likes_flavor_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_nature_hates_flavor_id_d9c22d5d" ON "pokemon_v2_nature"("hates_flavor_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_nature_increased_stat_id_949bb3bd" ON "pokemon_v2_nature"("increased_stat_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_nature_decreased_stat_id_d89610fc" ON "pokemon_v2_nature"("decreased_stat_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_naturebattlestylepreference_move_battle_style_id_f1dd2e92" ON "pokemon_v2_naturebattlestylepreference"("move_battle_style_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_naturebattlestylepreference_nature_id_03c37bf2" ON "pokemon_v2_naturebattlestylepreference"("nature_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_naturename_name_d0bfe13a" ON "pokemon_v2_naturename"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_naturename_nature_id_e6043d64" ON "pokemon_v2_naturename"("nature_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_naturename_language_id_7b3bb981" ON "pokemon_v2_naturename"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_naturepokeathlonstat_pokeathlon_stat_id_0d042f0d" ON "pokemon_v2_naturepokeathlonstat"("pokeathlon_stat_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_naturepokeathlonstat_nature_id_11b4efea" ON "pokemon_v2_naturepokeathlonstat"("nature_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_palpark_pokemon_species_id_639ae7f1" ON "pokemon_v2_palpark"("pokemon_species_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_palpark_pal_park_area_id_8df4fce8" ON "pokemon_v2_palpark"("pal_park_area_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_palparkarea_name_d27212e7" ON "pokemon_v2_palparkarea"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_palparkareaname_name_1fef3377" ON "pokemon_v2_palparkareaname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_palparkareaname_pal_park_area_id_9732132d" ON "pokemon_v2_palparkareaname"("pal_park_area_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_palparkareaname_language_id_1961595b" ON "pokemon_v2_palparkareaname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokeathlonstat_name_dfd410d4" ON "pokemon_v2_pokeathlonstat"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokeathlonstatname_name_21dff6f1" ON "pokemon_v2_pokeathlonstatname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokeathlonstatname_pokeathlon_stat_id_95163495" ON "pokemon_v2_pokeathlonstatname"("pokeathlon_stat_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokeathlonstatname_language_id_053b296b" ON "pokemon_v2_pokeathlonstatname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokedex_name_d3054d11" ON "pokemon_v2_pokedex"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokedex_region_id_d894ac3e" ON "pokemon_v2_pokedex"("region_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokedexdescription_pokedex_id_6519a3de" ON "pokemon_v2_pokedexdescription"("pokedex_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokedexdescription_language_id_908fbcc8" ON "pokemon_v2_pokedexdescription"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokedexname_name_9e582b7c" ON "pokemon_v2_pokedexname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokedexname_pokedex_id_e31703e5" ON "pokemon_v2_pokedexname"("pokedex_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokedexname_language_id_97285e07" ON "pokemon_v2_pokedexname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokedexversiongroup_version_group_id_2fbd3e54" ON "pokemon_v2_pokedexversiongroup"("version_group_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokedexversiongroup_pokedex_id_e9aaac37" ON "pokemon_v2_pokedexversiongroup"("pokedex_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemon_pokemon_species_id_e3dbafe1" ON "pokemon_v2_pokemon"("pokemon_species_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemon_name_b4719884" ON "pokemon_v2_pokemon"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonability_pokemon_id_2d9f606f" ON "pokemon_v2_pokemonability"("pokemon_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonability_ability_id_e6de97cc" ON "pokemon_v2_pokemonability"("ability_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonabilitypast_pokemon_id_1f8eef75" ON "pokemon_v2_pokemonabilitypast"("pokemon_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonabilitypast_generation_id_7c49a4a1" ON "pokemon_v2_pokemonabilitypast"("generation_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonabilitypast_ability_id_27ce43f2" ON "pokemon_v2_pokemonabilitypast"("ability_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemoncolor_name_be656ffc" ON "pokemon_v2_pokemoncolor"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemoncolorname_name_21cdd894" ON "pokemon_v2_pokemoncolorname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemoncolorname_pokemon_color_id_33a759e5" ON "pokemon_v2_pokemoncolorname"("pokemon_color_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemoncolorname_language_id_640a8271" ON "pokemon_v2_pokemoncolorname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemoncries_pokemon_id_f4f1bdc4" ON "pokemon_v2_pokemoncries"("pokemon_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemondexnumber_pokemon_species_id_0b92eca5" ON "pokemon_v2_pokemondexnumber"("pokemon_species_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemondexnumber_pokedex_id_5f882d27" ON "pokemon_v2_pokemondexnumber"("pokedex_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonegggroup_pokemon_species_id_d0fc6e47" ON "pokemon_v2_pokemonegggroup"("pokemon_species_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonegggroup_egg_group_id_cd305d10" ON "pokemon_v2_pokemonegggroup"("egg_group_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonevolution_location_id_fb0e2aa2" ON "pokemon_v2_pokemonevolution"("location_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonevolution_held_item_id_ef69a719" ON "pokemon_v2_pokemonevolution"("held_item_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonevolution_evolution_item_id_afdb70a5" ON "pokemon_v2_pokemonevolution"("evolution_item_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonevolution_trade_species_id_6eefecdc" ON "pokemon_v2_pokemonevolution"("trade_species_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonevolution_party_type_id_6af7cb68" ON "pokemon_v2_pokemonevolution"("party_type_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonevolution_party_species_id_aa57f0d1" ON "pokemon_v2_pokemonevolution"("party_species_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonevolution_known_move_type_id_de1a6bf4" ON "pokemon_v2_pokemonevolution"("known_move_type_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonevolution_known_move_id_301dfc54" ON "pokemon_v2_pokemonevolution"("known_move_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonevolution_gender_id_ccbf258a" ON "pokemon_v2_pokemonevolution"("gender_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonevolution_evolved_species_id_bcbf43a3" ON "pokemon_v2_pokemonevolution"("evolved_species_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonevolution_evolution_trigger_id_7d6a5102" ON "pokemon_v2_pokemonevolution"("evolution_trigger_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonform_name_fe094947" ON "pokemon_v2_pokemonform"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonform_pokemon_id_f1307072" ON "pokemon_v2_pokemonform"("pokemon_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonform_version_group_id_88573ce7" ON "pokemon_v2_pokemonform"("version_group_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonformgeneration_pokemon_form_id_63610ed9" ON "pokemon_v2_pokemonformgeneration"("pokemon_form_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonformgeneration_generation_id_2f4d5474" ON "pokemon_v2_pokemonformgeneration"("generation_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonformname_pokemon_form_id_7c4f1fb5" ON "pokemon_v2_pokemonformname"("pokemon_form_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonformname_language_id_2570013b" ON "pokemon_v2_pokemonformname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonformname_name_4496fca6" ON "pokemon_v2_pokemonformname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonformsprites_pokemon_form_id_b09cb8b3" ON "pokemon_v2_pokemonformsprites"("pokemon_form_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonformtype_type_id_10672412" ON "pokemon_v2_pokemonformtype"("type_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonformtype_pokemon_form_id_bff24ddc" ON "pokemon_v2_pokemonformtype"("pokemon_form_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemongameindex_version_id_2f3cda39" ON "pokemon_v2_pokemongameindex"("version_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemongameindex_pokemon_id_d1278b45" ON "pokemon_v2_pokemongameindex"("pokemon_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonhabitat_name_e36918ba" ON "pokemon_v2_pokemonhabitat"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonhabitatname_name_0b8b38c3" ON "pokemon_v2_pokemonhabitatname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonhabitatname_pokemon_habitat_id_8bb656e6" ON "pokemon_v2_pokemonhabitatname"("pokemon_habitat_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonhabitatname_language_id_b247fa35" ON "pokemon_v2_pokemonhabitatname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonitem_item_id_f2d37afe" ON "pokemon_v2_pokemonitem"("item_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonitem_version_id_4f5c2a1c" ON "pokemon_v2_pokemonitem"("version_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonitem_pokemon_id_d5dd8083" ON "pokemon_v2_pokemonitem"("pokemon_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonmove_move_learn_method_id_f7503746" ON "pokemon_v2_pokemonmove"("move_learn_method_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonmove_version_group_id_ca4c374c" ON "pokemon_v2_pokemonmove"("version_group_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonmove_pokemon_id_ca9e0e55" ON "pokemon_v2_pokemonmove"("pokemon_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonmove_move_id_b5f71cf7" ON "pokemon_v2_pokemonmove"("move_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonshape_name_d7251478" ON "pokemon_v2_pokemonshape"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonshapename_name_224dc527" ON "pokemon_v2_pokemonshapename"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonshapename_pokemon_shape_id_69bb934f" ON "pokemon_v2_pokemonshapename"("pokemon_shape_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonshapename_language_id_e094373f" ON "pokemon_v2_pokemonshapename"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonspecies_evolves_from_species_id_6e40aea2" ON "pokemon_v2_pokemonspecies"("evolves_from_species_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonspecies_pokemon_shape_id_9420bbbf" ON "pokemon_v2_pokemonspecies"("pokemon_shape_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonspecies_pokemon_habitat_id_61d7914c" ON "pokemon_v2_pokemonspecies"("pokemon_habitat_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonspecies_pokemon_color_id_27cb23c7" ON "pokemon_v2_pokemonspecies"("pokemon_color_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonspecies_growth_rate_id_78ff36e3" ON "pokemon_v2_pokemonspecies"("growth_rate_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonspecies_generation_id_57b5b3ef" ON "pokemon_v2_pokemonspecies"("generation_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonspecies_evolution_chain_id_d94981c6" ON "pokemon_v2_pokemonspecies"("evolution_chain_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonspecies_name_f1ec390b" ON "pokemon_v2_pokemonspecies"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonspeciesdescription_pokemon_species_id_c62bce07" ON "pokemon_v2_pokemonspeciesdescription"("pokemon_species_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonspeciesdescription_language_id_75b5e267" ON "pokemon_v2_pokemonspeciesdescription"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonspeciesflavortext_version_id_67eb47ad" ON "pokemon_v2_pokemonspeciesflavortext"("version_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonspeciesflavortext_pokemon_species_id_345e9c6c" ON "pokemon_v2_pokemonspeciesflavortext"("pokemon_species_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonspeciesflavortext_language_id_725fcf28" ON "pokemon_v2_pokemonspeciesflavortext"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonspeciesname_name_e53fa719" ON "pokemon_v2_pokemonspeciesname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonspeciesname_pokemon_species_id_6566cdc8" ON "pokemon_v2_pokemonspeciesname"("pokemon_species_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonspeciesname_language_id_1a5acda5" ON "pokemon_v2_pokemonspeciesname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonsprites_pokemon_id_37e1b6e5" ON "pokemon_v2_pokemonsprites"("pokemon_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonstat_stat_id_ff99830f" ON "pokemon_v2_pokemonstat"("stat_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemonstat_pokemon_id_224bda7f" ON "pokemon_v2_pokemonstat"("pokemon_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemontype_type_id_50c80158" ON "pokemon_v2_pokemontype"("type_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemontype_pokemon_id_8cd53409" ON "pokemon_v2_pokemontype"("pokemon_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemontypepast_type_id_c7a01783" ON "pokemon_v2_pokemontypepast"("type_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemontypepast_pokemon_id_7c9bb3e4" ON "pokemon_v2_pokemontypepast"("pokemon_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_pokemontypepast_generation_id_9dbf45f3" ON "pokemon_v2_pokemontypepast"("generation_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_region_name_8acf2189" ON "pokemon_v2_region"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_regionname_name_d9c7dec9" ON "pokemon_v2_regionname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_regionname_region_id_70a321d1" ON "pokemon_v2_regionname"("region_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_regionname_language_id_b977a545" ON "pokemon_v2_regionname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_stat_name_abcae9af" ON "pokemon_v2_stat"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_stat_move_damage_class_id_0ed19a23" ON "pokemon_v2_stat"("move_damage_class_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_statname_name_e6d5a1d2" ON "pokemon_v2_statname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_statname_stat_id_fadbe40b" ON "pokemon_v2_statname"("stat_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_statname_language_id_813421dc" ON "pokemon_v2_statname"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_supercontestcombo_second_move_id_15fdde61" ON "pokemon_v2_supercontestcombo"("second_move_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_supercontestcombo_first_move_id_b595ebbb" ON "pokemon_v2_supercontestcombo"("first_move_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_supercontesteffectflavortext_super_contest_effect_id_632d04b4" ON "pokemon_v2_supercontesteffectflavortext"("super_contest_effect_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_supercontesteffectflavortext_language_id_a8b218a8" ON "pokemon_v2_supercontesteffectflavortext"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_type_name_90172f48" ON "pokemon_v2_type"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_type_move_damage_class_id_5f546a8f" ON "pokemon_v2_type"("move_damage_class_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_type_generation_id_f3988f1c" ON "pokemon_v2_type"("generation_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_typeefficacy_target_type_id_bf2be275" ON "pokemon_v2_typeefficacy"("target_type_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_typeefficacy_damage_type_id_1b7c2d73" ON "pokemon_v2_typeefficacy"("damage_type_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_typeefficacypast_target_type_id_2e9e1cb6" ON "pokemon_v2_typeefficacypast"("target_type_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_typeefficacypast_generation_id_43b555ea" ON "pokemon_v2_typeefficacypast"("generation_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_typeefficacypast_damage_type_id_b8eae4c9" ON "pokemon_v2_typeefficacypast"("damage_type_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_typegameindex_type_id_8264662d" ON "pokemon_v2_typegameindex"("type_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_typegameindex_generation_id_520a4043" ON "pokemon_v2_typegameindex"("generation_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_typename_name_95fbeace" ON "pokemon_v2_typename"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_typename_type_id_3fe2e4d2" ON "pokemon_v2_typename"("type_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_typename_language_id_6b15eb1d" ON "pokemon_v2_typename"("language_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_version_name_a1b54eaa" ON "pokemon_v2_version"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_version_version_group_id_1ab67107" ON "pokemon_v2_version"("version_group_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_versiongroup_name_4c396513" ON "pokemon_v2_versiongroup"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_versiongroup_generation_id_f7073699" ON "pokemon_v2_versiongroup"("generation_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_versiongroupmovelearnmethod_version_group_id_36c973b6" ON "pokemon_v2_versiongroupmovelearnmethod"("version_group_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_versiongroupmovelearnmethod_move_learn_method_id_7e827604" ON "pokemon_v2_versiongroupmovelearnmethod"("move_learn_method_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_versiongroupregion_region_id_8f876d0b" ON "pokemon_v2_versiongroupregion"("region_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_versiongroupregion_version_group_id_a3445bcb" ON "pokemon_v2_versiongroupregion"("version_group_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_versionname_name_df504fd7" ON "pokemon_v2_versionname"("name");

-- CreateIndex
CREATE INDEX "pokemon_v2_versionname_version_id_84baf0a3" ON "pokemon_v2_versionname"("version_id");

-- CreateIndex
CREATE INDEX "pokemon_v2_versionname_language_id_890e148a" ON "pokemon_v2_versionname"("language_id");

