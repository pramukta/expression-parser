require 'test/unit'
require 'test/unit/ui/console/testrunner'
require File.expand_path(File.dirname(__FILE__)+'/../default_interpreter')

class InterpreterTest < Test::Unit::TestCase
  def test_addition
    interpreter = Pixelate::DefaultInterpreter.new([3,4,:+])
    assert_nothing_raised {
      output = interpreter.run
      assert_equal 7, output
    }
  end
  def test_subtraction
    interpreter = Pixelate::DefaultInterpreter.new([15,4,:-])
    assert_nothing_raised {
      output = interpreter.run
      assert_equal 11, output
    }
  end
  def test_multiplication
    interpreter = Pixelate::DefaultInterpreter.new([3,4,:*])
    assert_nothing_raised {
      output = interpreter.run
      assert_equal 12, output
    }
  end
  def test_division
    interpreter = Pixelate::DefaultInterpreter.new([8,4,:/])
    assert_nothing_raised {
      output = interpreter.run
      assert_equal 2, output
    }
  end
  def test_power
    interpreter = Pixelate::DefaultInterpreter.new([4,2,'^'.to_sym])
    assert_nothing_raised {
      output = interpreter.run
      assert_equal 16, output
    }    
  end
  def test_bad_input
    interpreter = Pixelate::DefaultInterpreter.new([8,5,1,:+])
    assert_raises SystemStackError do
      output = interpreter.run
    end
  end
  def test_complex_numeric
    interpreter = Pixelate::DefaultInterpreter.new([3.0, 4.0, 2.0, :*, 1.0, 5.0, :-, :/, :+])
    assert_nothing_raised {
      output = interpreter.run
      assert_equal 1, output
    }
  end
end

Test::Unit::UI::Console::TestRunner.run(InterpreterTest)