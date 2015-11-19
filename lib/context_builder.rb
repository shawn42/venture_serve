class ContextBuilder

  def user(context_params)
    { current_user: context_params[:current_user], 
      }.with_indifferent_access
  end

  def user_and_id(context_params)
    user(context_params).merge(id: context_params[:params][:id]).with_indifferent_access
  end

  def user_and_character(context_params)
    user(context_params).merge(character_id: context_params[:params][:character_id]).with_indifferent_access
  end


  def character(context_params)
    params = context_params[:params]

    info = {character: params.require(:character).permit(
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
      :charisma
      )}
    user_and_id(context_params).merge(info).with_indifferent_access
  end

end


