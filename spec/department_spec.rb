require './spec/spec_helper'

describe Department do
	let(:customer_service) {Department.new("Customer Service")}
	let(:bobbi) {Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})}
	let(:aaron) {Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"}) }

	describe '#initialize' do
		it 'exists' do
			expect(customer_service).to be_a(Department)
		end

		it 'has attributes' do
			expect(customer_service.name).to eq("Customer Service")
			expect(customer_service.employees).to eq([])
			expect(customer_service.expenses).to eq(0)
		end
	end

	describe '#hire' do
		it 'hires an employee into its department' do
			customer_service.hire(bobbi)
			customer_service.hire(aaron)

			expect(customer_service.employees).to eq([bobbi, aaron])
		end
	end

	describe '#expense' do
		it 'expenses to the department' do
			customer_service.expense(100, bobbi)
			customer_service.expense(25, aaron)

			expect(customer_service.expenses).to eq(125)
		end
	end

	describe '#employee_expenses' do
		it 'returns a hash with employee name as key and employee expenses as value' do
			expect(customer_service.employee_expenses).to eq({bobbi => 0, aaron => 0})

			customer_service.expense(100, bobbi)
			customer_service.expense(25, aaron)
			
			expected = {bobbi => 100, aaron => 25}

			expect(customer_service.employee_expenses).to eq(expected)

			customer_service.expense(50, aaron)

			expected = {bobbi => 100, aaron => 75}

			expect(customer_service.expenses).to eq(175)
			expect(customer_service.eemployee_expenses).to eq(expected)
		end
	end
end