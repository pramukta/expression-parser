require 'test/unit'
require 'test/unit/ui/console/testrunner'
require File.expand_path(File.dirname(__FILE__)+'/../expr')

class ExprTest < Test::Unit::TestCase
    def setup
       @parser = ExpressionParser::ExprMachine.new
    end
    
    def test_parser_exists
       assert_not_nil @parser
       assert @parser.respond_to?(:parse),
         "ExprMachine should have a parse method"
       assert_equal 1, @parser.method(:parse).arity, 
         "ExprMachine should have a parse method that takes 1 argument"
    end
    
    def test_arithmetic_parsing
      assert_nothing_raised { 
        t = @parser.parse("3 + 4")
        assert_equal([3.0, 4.0, :+].to_s, t.to_s)
      }
      
      assert_nothing_raised {
        t = @parser.parse("3 + 4 * 2 / ( 1 - 5 )")
        assert_equal [3.0, 4.0, 2.0, :*, 1.0, 5.0, :-, :/, :+].to_s, t.to_s
      }
      
      assert_raise(ArgumentError) {
        @parser.parse("3 + + 4")
      }
      assert_raise(ArgumentError) {
        @parser.parse("3 3*4")  
      }
      assert_raise(ArgumentError) { 
        @parser.parse("3.3.3 + 4")
      }
      
      assert_nothing_raised {
        t = @parser.parse("3 + 4^2 * 10")
        assert_equal [3.0, 4.0, 2.0, :^, 10.0, :*, :+].to_s, t.to_s
      }
    end
    
    def test_variable_parsing
      
    end
    
    def test_function_parsing
      assert_nothing_raised {
        t = @parser.parse("3 * CORRELATE(A, B) + 5.0")
        assert_equal [3.0, "A", "B", "CORRELATE", :*, 5.0, :+], t
      }

      assert_nothing_raised {
        t = @parser.parse("3 * CORRELATE(A * ABS(C), B) + 5.0^2")
        assert_equal [3.0, "A", "C", "ABS", :*, "B", "CORRELATE", :*, 5.0, 2.0, :^, :+], t
      }
    end
end

Test::Unit::UI::Console::TestRunner.run(ExprTest)