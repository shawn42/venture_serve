class CharacterSerializer < ActiveModel::Serializer
  attributes :id,
    :created_at,
    :updated_at,
    :name,
    :character_class,
    :level,
    :current_health,
    :current_mana,
    :strength,
    :intelligence,
    :wisdom,
    :dexterity,
    :constitution,
    :charisma,
    :x,
    :y

end
