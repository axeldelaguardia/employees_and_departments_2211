require './spec/spec_helper'

describe Budget do
	let(:customer_service) {Department.new("Customer Service")}
	let(:sales) {Department.new("Sales")}
	let(:bobbi) {Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})}
	let(:megan) {Employee.new({name: "Megan Ralston", age: "40", salary: "135000"})}
	let(:aaron) {Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})}
	let(:lisa) {Employee.new({name: "Lisa Robinson", age: "43", salary: "120000"})}
	let(:budget) {Budget.new('2022')}

	before do
		customer_service.hire(bobbi)
		customer_service.hire(megan)

		sales.hire(aaron)
		sales.hire(lisa)

		customer_service.expense(100)
		customer_service.expense(25)

		sales.expense(100)
		sales.expense(300)
	end

	context 'iteration 3' do
		describe '#initialize' do
			it 'exists' do
				expect(budget).to be_a(Budget)
			end

			it 'has attributes' do
				expect(budget.year).to eq(2022)
				expect(budget.departments).to eq([])
			end
		end

		describe '#add_department' do
			it 'adds department to collection of departments' do
				budget.add_department(customer_service)
				budget.add_department(sales)

				expect(budget.departments).to eq([customer_service, sales])
			end
		end

		describe '#dept_with_expenses_under' do
			it 'returns a hash with departments and expenses under a specific amount' do
				budget.add_department(customer_service)
				budget.add_department(sales)

				expected = {customer_service => 125, sales => 400}

				expect(budget.dept_with_expenses_under(500)).to eq(expected)

				customer_service.expense(25)
				sales.expense(400)

				expected = {customer_service => 150}

				expect(budget.dept_with_expenses_under(500)).to eq(expected)
			end
		end

		describe '#employee_salaries' do
			it 'returns a hash with all employees and their salaries' do
				budget.add_department(customer_service)
				budget.add_department(sales)

				expected = {
					bobbi.salary =>  100000,
					megan.salary => 135000,
					aaron.salary => 90000,
					lisa.salary => 120000
				}

				expect(budget.employee_salaries).to eq(expected)

				lisa.give_raise(5000)

				expected = {
					bobbi.salary =>  100000,
					megan.salary => 135000,
					aaron.salary => 90000,
					lisa.salary => 125000
				}

				expect(budget.employee_salaries).to eq(expected)
			end
		end
	end
end