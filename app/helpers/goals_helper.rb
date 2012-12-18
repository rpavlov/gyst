module GoalsHelper

	def goals_complete_percentage(goals_complete, goals_total)
		unless goals_total == 0 
			goals_complete.to_f / goals_total.to_f * 100
		end
	end

	def setup_goalset(goalset)
		goalset.goals.build
		goalset
	end

end
