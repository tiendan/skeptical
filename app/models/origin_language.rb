class OriginLanguage < ActiveRecord::Base
  attr_accessible :name
  has_many :human_name
end
