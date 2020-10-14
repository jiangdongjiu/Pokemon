class Move < ApplicationRecord
  belongs_to :type
  has_many :pokemon_moves
  has_many :pokemons, through: :pokemon_moves

  validates name, presence: true
end
