require 'minitest/autorun'

class NoExperienceError < StandardError
  # Do something
end

class Employee
  def hire
    # Do something
    raise NoExperienceError, "Required experience not met."
  end
end

class MyTest < Minitest::Test
  def test_no_experience_error
    employee = Employee.new

    assert_raises(NoExperienceError) { employee.hire }
  end
end
