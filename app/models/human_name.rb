class HumanName < ActiveRecord::Base
  attr_accessible :description, :gender, :is_forbidden, :is_natural, :name, :origin_language_id

  belongs_to :origin_language

	def self.split_parameter(parameter)
		return parameter ? parameter.split(",") : []
	end

	def self.search(params)
		initial = split_parameter(params[:ilk])
		origin = split_parameter(params[:koken])
		gender_parameter = split_parameter(params[:cinsiyet])
		is_natural = params[:dogal] ? true : false
		safe_letters = params[:turkce] == "0" ? 1 : 0
		current_page = (params[:sayfa] and params[:sayfa] != "") ? params[:sayfa] : 1
		gender = ['C']
		
		if gender_parameter.empty?()
			gender.append('M')
			gender.append('F')
		end
		
		if gender_parameter.include?("E")
			gender.append('M')
		end
		if gender_parameter.include?("K")
			gender.append('F')
		end
		
		query = HumanName.where("(SUBSTR(name, 1, 1) IN (?) OR ? = 0) AND (origin_language_id IN (?) OR ? = 0) AND (is_natural = ? OR ? IS NULL) AND (NOT ? OR (name NOT LIKE '%ç%' AND name NOT LIKE '%ğ%' AND name NOT LIKE '%ı%' AND name NOT LIKE '%ö%' AND name NOT LIKE '%ş%' AND name NOT LIKE '%ü%' AND name NOT LIKE '%Ç%' AND name NOT LIKE '%Ğ%' AND name NOT LIKE '%İ%' AND name NOT LIKE '%Ö%' AND name NOT LIKE '%Ş%' AND name NOT LIKE '%Ü%')) AND gender IN (?)", initial, initial.length, origin, origin.length, is_natural, params[:dogal], safe_letters, gender).order("name").paginate(:per_page => 3, :page => current_page) 
		
		return query
	end
end
