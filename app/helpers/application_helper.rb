module ApplicationHelper
	def get_turkish_true_false(value)
		if value
			return "Evet"
		else
			return "Hayır"
		end
	end
end
