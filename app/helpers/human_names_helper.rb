module HumanNamesHelper
	def options_genders_for_select
		return [["Erkek", "M"], ["Kadın", "F"], ["Ortak", "C"]]
	end
	
	def search_options_genders_for_select
		return [["Erkek", "E"], ["Kadın", "K"]]
	end
	
	def gender_name(gender_code)
		case gender_code
			when "M"
				return "Erkek"
			when "F"
				return "Kadın"
			when "C"
				return "Ortak"
			else
				return ""
		end
	end
end
