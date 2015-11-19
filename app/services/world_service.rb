class WorldService
  include DDC::ResponseBuilder

  def view_for_character(context)
    char = context[:current_user].characters.find_by(id: context[:character_id])
    not_found(char) unless char.present?

    # hardcode a 10x10 grid around the character
    ok [{
        x: char.x - 5,
        y: char.y - 5,
        width: 10,
        height: 10,
        tiles: [0]*(10*10)
      }]
  end


end

