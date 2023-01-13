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

	def dept_with_expenses_under(amount)
		returned_departments = Hash.new(0)
		@departments.each do |department|
			expenses = department.expenses
			returned_departments[department] = expenses if expenses < amount
		end
		returned_departments
	end
end