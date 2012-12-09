class HumanName < ActiveRecord::Base
  attr_accessible :description, :gender, :is_forbidden, :is_natural, :name, :origin_language_id

  belongs_to :origin_language
end
