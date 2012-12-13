module GoalsHelper

	def goals_complete_percentage(goals_complete, goals_total)
		if goals_complete.nil? or goals_total.nil? 
			0
		else
			goals_complete.count.to_f / goals_total.count.to_f * 100
		end
	end

end
