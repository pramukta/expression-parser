module Pixelate
  class Interpreter
    def initialize(token_stream, constants={})
      @token_stream = token_stream
      @mark = 0
      @stack = []
      @constants = constants
    end
    
    def step
      if @mark >= @token_stream.length
        raise EOFError, "End of token stream reached."
      end
      e = @token_stream[@mark]
      @mark = @mark + 1
      if(e.is_a?(Symbol) && (OPERATORS.include?(e) || FUNCTIONS.include?(e)))
        # how many arguments does this method take
        args = []
        method(e).arity.times do
          args.unshift @stack.pop
        end
        @stack.push method(e).call(*args)
      elsif(e.is_a?(Symbol) && @constants.keys.include?(e))
          @stack.push @constants[e]
      elsif(!e.is_a?(Symbol))
        @stack.push e
      else
        raise ArgumentError, "Unexpected symbol #{e.inspect}"
      end
    end
    
    def run
      while(@mark < @token_stream.length)
        self.step
      end
      if(@stack.length != 1) 
        raise SystemStackError, "Stack didn't end up empty, script must be corrupt"
      end
      return @stack.pop
    end
    
    OPERATORS = [:+, :-, :*, :/, '^'.to_sym]
    FUNCTIONS = []
    
    private          
    def +(a,b)
      a + b
    end
    def -(a,b)
      a - b
    end
    def *(a,b)
      a * b
    end
    def /(a,b)
      a / b
    end
    def ^(a,b)
      a ** b
    end
  end
end