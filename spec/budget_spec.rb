require './spec/spec_helper'

describe Budget do
	let(:customer_service) {Department.new("Customer Service")}
	let(:sales) {Department.new("Sales")}
	let(:bobbi) {Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})}
	let(:megan) {Employee.new({name: "Megan Ralston", age: "40", salary: "135000"})}
	let(:aaron) {Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})}
	let(:lisa) {Employee.new({name: "Lisa Robinson", age: "43", salary: "120000"})}
	let(:budget) {Budget.new}

	before do
		customer_service.hire(bobbi)
		customer_service.hire(megan)

		sales.hire(aaron)
		sales.hire(lisa)

		customer_service.expense(100)
		customer_service.expense(25)

		sales.expense(450)
		sales.expense(300)
	end

	context 'iteration 3' do
		describe '#initialize' do
			it 'exists' do
				expect(budget).to be_a(Budget)
			end

			it 'has attributes' do
				expect(budget.departments).to eq([])
			end
		end

		describe '#add_department' do
			budget.add_department(customer_service)
			budget.add_department(sales)

			expect(budget.departments).to eq([customer_service, sales])
		end
	end
end