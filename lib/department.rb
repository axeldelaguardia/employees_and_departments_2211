class Department
	attr_reader :name,
							:employees,
							:expenses,
							:employee_expenses

	def initialize(name)
		@name = name
		@employees = []
		@expenses = 0
		@employee_expenses = Hash.new(0)
	end

	def hire(employee)
		@employees << employee
	end

	def expense(amount, employee)
		@expenses += amount
		employee_expenses[employee] += amount
	end
end