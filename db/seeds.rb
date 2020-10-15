require 'open-uri'
require 'json'

PokemonAbility.delete_all
PokemonMove.delete_all
PokemonType.delete_all
Type.delete_all
Move.delete_all
Ability.delete_all
Pokemon.delete_all

# fetch and decode JSON resource from API URL
def api_fetch(url)
  JSON.parse(URI.open(url).read)
end

def pokemon_url(id)
  "https://pokeapi.co/api/v2/pokemon/#{id}/"
end

def find_en_effect(effect_entries)
  en_effect = ''

  effect_entries.each do |effect_entry|
    if effect_entry['language']['name'] == 'en'
      en_effect = effect_entry['effect']
      break
    end
  end

  en_effect
end

pokemon_ids = 1..3

pokemon_ids.each do |pokemon_id|
  pokemon = api_fetch(pokemon_url(pokemon_id))
  abilities = pokemon['abilities'].map { |ability_url| api_fetch(ability_url['ability']['url']) }
  moves = pokemon['moves'].map { |move_url| api_fetch(move_url['move']['url']) }
  types = pokemon['types'].map { |type_url| api_fetch(type_url['type']['url']) }

  pokemon_entry = Pokemon.create(name: pokemon['name'], weight: pokemon['weight'], height: pokemon['height'])

  abilities.each do |ability|
    ability_entry = Ability.find_or_create_by(name: ability['name'], effect: find_en_effect(ability['effect_entries']))
    PokemonAbility.create(pokemon: pokemon_entry, ability: ability_entry)
  end

  types.each do |type|
    type_entry = Type.find_or_create_by(name: type['name'])
    PokemonType.create(pokemon: pokemon_entry, type: type_entry)
  end

  moves.each do |move|
    type_entry = Type.find_or_create_by(name: move['type']['name'])
    move_entry = Move.find_or_create_by(
      name: move['name'],
      accuracy: ['accuracy'],
      power: ['power'],
      pp: ['pp'],
      type: type_entry
    )
    PokemonMove.create(pokemon: pokemon_entry, move: move_entry)
  end
end
