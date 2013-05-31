class Ability
	include CanCan::Ability

	def initialize(user) 
		# user ||= User.new
		can :manage, :all
		# ## List of Actions ##
		# # :read (index)
		# # :create (create)
		# # :show (show)
		# # :update (update)
		# # :destroy (destroy)
		# # :manage (all)

		# ## Object ##
		# #Survey
		# #SurveyResult

		# if user.role == "admin"
		# 	can :manage, :all
		# end

		# if user.role == "guest" #Not logged in
		# 	can :create, SurveyResult
		# 	can :read, Survey
		# end
	end 
end