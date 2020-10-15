# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_201_014_190_640) do
  create_table 'abilities', force: :cascade do |t|
    t.string 'name'
    t.text 'effect'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'moves', force: :cascade do |t|
    t.string 'name'
    t.integer 'accuracy'
    t.integer 'power'
    t.integer 'pp'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'type_id', null: false
    t.index ['type_id'], name: 'index_moves_on_type_id'
  end

  create_table 'pokemon_abilities', force: :cascade do |t|
    t.integer 'pokemon_id', null: false
    t.integer 'ability_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['ability_id'], name: 'index_pokemon_abilities_on_ability_id'
    t.index ['pokemon_id'], name: 'index_pokemon_abilities_on_pokemon_id'
  end

  create_table 'pokemon_moves', force: :cascade do |t|
    t.integer 'pokemon_id', null: false
    t.integer 'move_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['move_id'], name: 'index_pokemon_moves_on_move_id'
    t.index ['pokemon_id'], name: 'index_pokemon_moves_on_pokemon_id'
  end

  create_table 'pokemon_types', force: :cascade do |t|
    t.integer 'pokemon_id', null: false
    t.integer 'type_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['pokemon_id'], name: 'index_pokemon_types_on_pokemon_id'
    t.index ['type_id'], name: 'index_pokemon_types_on_type_id'
  end

  create_table 'pokemons', force: :cascade do |t|
    t.string 'name'
    t.integer 'weight'
    t.integer 'height'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'types', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'moves', 'types'
  add_foreign_key 'pokemon_abilities', 'abilities'
  add_foreign_key 'pokemon_abilities', 'pokemons'
  add_foreign_key 'pokemon_moves', 'moves'
  add_foreign_key 'pokemon_moves', 'pokemons'
  add_foreign_key 'pokemon_types', 'pokemons'
  add_foreign_key 'pokemon_types', 'types'
end
