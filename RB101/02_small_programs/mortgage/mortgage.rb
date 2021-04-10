# frozen_string_literal: true

require 'pry'

=begin rdoc

= PEDAC Template

== (Understand the) Problem

First, identify the inputs and the outputs of the problem

* Inputs:
  1. The loan amount
  2. The Annual Percentage Rate
  3. The load duration
* Output:
  1. Mortgage

---

*Problem Domain:*
Algebra

---

*Implicit Requirements:*
Convertion of time in years/months/days.
Working with percentage
Check duration
Down payment? (let's say no)
Dollars only? (let's say yes, although it doesn't change the logic)

---

*Mental Model:*
Using a loan amount, duration and Annual Percentage Rate, calculate the
monthly payment of the mortgage.

---

== Examples / Test Cases / Edge Cases

*Examples:*

* Example 1
  * Inputs:
    1. Loan amount:             $300,000
    2. Annual Percentage Rate:       3.0%
    3. Load duration:                 30 years
  * Output:                       $1,264.81

* Example 2
  * Inputs:
    1. Loan amount:             $400,000
    2. Annual Percentage Rate:       2.5%
    3. Load duration:                 15 years
  * Output:                       $2,667.15

* Example 3
  * Inputs:
    1. Loan amount:            $1,000,000
    2. Annual Percentage Rate:        1.3%
    3. Load duration:                  10 years
  * Output:                        $8,891.23
    1.

* Example 4
  * Inputs:
    1. Loan amount:             $100,000
    2. Annual Percentage Rate:       1.1%
    3. Load duration:                 10 years
  * Output:                         $880.38

---

== Data Structure

*Your Data Structure:*
Variables should be enough

---

== Algorithm

*Your Algorith:*
1. Ask user for the total loan amount in dollars
  1. Check if it's a valid number
  2. Ask again if not a valid number, otherwise resave as integer
2. Ask user for the APR in percentage
  1. Check if it's a valid number
  2. Ask again if not a valid number, otherwise resave as float
3. Ask for the loan duration in years
  1. Check if it's a valid number
  2. Ask again if not a valid number, otherwise resave as integer
4. From the APR, calculate the monthly interest rate (j)
5. Convert loan duration in years to months (n)
6. With loan amount, monthly interest rate and loan duration in months,
calculate the monthly payment (m)

== Code

=end

def number?(num)
  num.to_f.to_s == num || num.to_i.to_s == num
end

def year_to_month(yearly, op)
  monthly = case op
            when 'divise'
              yearly / 12
            when 'multiply'
              yearly * 12
            end

  monthly
end

def monthly_payment(p, j, n)
  p * (j / (1 - (1 + j)**(-n)))
end

loan_amount = ''
apr = ''
loan_duration = ''

puts 'Hello! We are going to calculate your mortgage! Yeaah!'
puts 'First we need some informations. Can you give us the amount of your ' \
     'current loan?'

loop do
  loan_amount = gets.chomp

  if number?(loan_amount)
    loan_amount = loan_amount.to_i
    break
  else
    puts 'Oops! Make sure your answer is a number!'
  end
end

puts 'Good! Next can we have your APR? (in percentage, without the symbol)'

loop do
  apr = gets.chomp

  if number?(apr)
    apr = apr.to_f
    break
  else
    puts 'Oops! Make sure your answer is a percentage without the' \
         'symbol!'
  end
end

puts "That much? Damn. Okay what's the loan duration (in years)?"

loop do
  loan_duration = gets.chomp

  if number?(loan_duration)
    loan_duration = loan_duration.to_i
    break
  else
    puts 'Oops! Make sure your answer is a whole number!'
  end
end

puts 'Thank you! Let me check...'

puts "Your loan amount: $#{loan_amount}"
puts "Your APR: #{apr}%"
puts "Your loan duration: #{loan_duration} years"

monthly_interest_rate = year_to_month((apr / 100), 'divise')

# binding.pry
m = monthly_payment(loan_amount, monthly_interest_rate,
                    year_to_month(loan_duration, 'multiply'))

puts "Your monthly payment amout to $#{m} / month!"
