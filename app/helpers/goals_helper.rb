module GoalsHelper

	def goals_complete_percentage(goals_complete, goals_total)
		goals_complete.count.to_f / goals_total.count.to_f * 100
	end

end
