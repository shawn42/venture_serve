class CharacterService
  include DDC::ResponseBuilder

  def find_all(context)
    batts = context[:current_user].characters
    ok(batts)
  end

  def find(context)
    id, user = context.values_at :id, :current_user
    char = user.characters.where(id: id).first
    if char
      ok(char)
    else
      not_found(char)
    end
  end

  def update(context)
    id, updates, user = context.values_at :id, :character, :current_user
    char = user.characters.where(id: id).first
    if char.update_attributes(updates)
      ok(char)
    else
      not_valid(char)
    end
  end

  def create(context)
    atts, user = context.values_at :character, :current_user
    char = user.characters.create(atts)
    if char.persisted?
      created(char)
    else
      not_valid(char)
    end
  end

  def destroy(context)
    id, updates, user = context.values_at :id, :character, :current_user
    char = user.characters.where(id: id).first
    if char.destroy
      deleted(char)
    else
      not_found()
    end
  end

end

