class Department
	attr_reader :name,
							:employees,
							:expenses,
							:employee_expenses,
							:emp_expenses

	def initialize(name)
		@name = name
		@employees = []
		@expenses = 0
		@employee_expenses = Hash.new(0)
		@emp_expenses = Hash.new{|k, v| k[v] = []}
	end

	def hire(employee)
		@employees << employee
	end

	def expense(amount, employee)
		@expenses += amount
		employee_expenses[employee] += amount
		record_employee_expense(amount, employee)
	end

	def record_employee_expense(amount, employee)
		@emp_expenses[employee] << amount
	end
end