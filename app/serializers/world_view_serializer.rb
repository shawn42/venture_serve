class WorldViewSerializer < ActiveModel::Serializer
  attributes :character_id :x, :y, :width, :height, :tiles
end
