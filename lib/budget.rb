class Budget
	attr_reader :departments

	def initialize
		@departments = []
	end

	def add_department(department)
		@departments << department
	end
end