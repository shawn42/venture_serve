class Character < ActiveRecord::Base
  belongs_to :user

  # TODO verify level and stat point totals on new characters
end
