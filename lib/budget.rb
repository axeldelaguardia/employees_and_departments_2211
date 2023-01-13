class Budget
	attr_reader :departments,
							:year

	def initialize(year)
		@year = year.to_i
		@departments = []
	end

	def add_department(department)
		@departments << department
	end
end