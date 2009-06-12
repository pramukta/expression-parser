%%{
	machine expr;
	
	action mark { 
	  @mark = fpc 
	  # puts @stack.inspect
	  # puts @queue.inspect
	}
  
  action separator_token {
    validate_token(:separator, @last_token_type, data, fpc)
    while(@stack.last != '('.to_sym) do
      if(@stack.empty?) 
        raise ArgumentError, "Mismatched Parentheses"
      end
      @queue << @stack.pop
    end
    @mark = nil
    @last_token_type = :separator
  }
  
  action number_token { 
    validate_token(:literal, @last_token_type, data, fpc)
    number = data[@mark..fpc-1].to_f
    @queue << number
    @mark = nil
    @last_token_type = :literal
    # puts "LOGGING: #{number}"
  }
  action function_or_reference_token {
    reference = data[@mark..fpc-1]
    if FUNCTION_TOKENS.include?(reference)
      validate_token(:function, @last_token_type, data, fpc)
      @stack.push reference.downcase.to_sym
      @last_token_type = :function
    else
      validate_token(:reference, @last_token_type, data, fpc)
      @queue << reference
      @last_token_type = :reference
    end
    @mark = nil
    # puts "LOGGING: #{reference}"
    # puts "LOGGING: #{@stack.inspect}"
    # puts "LOGGING: #{@queue.inspect}"
  }
  action operator_token {
    validate_token(:operator, @last_token_type, data, fpc)
    token = data[@mark..fpc-1].to_sym
    # puts "LOGGING: #{token}"
    # I think this is actually the correct condition
    while(PRECEDENCE.keys.include?(@stack.last) || FUNCTION_TOKENS.include?(@stack.last.to_s.upcase))
      # puts "#{precedence(token)} #{precedence(@stack.last)}"
      # puts @stack.inspect
      # puts @queue.inspect
      if(precedence(token) <= precedence(@stack.last))
        @queue << @stack.pop
      else
        # prevent the infinite loop
        break
      end
    end
    @stack.push(token)
    @last_token_type = :operator
  }
  action left_paren_token {
    validate_token(:left_paren, @last_token_type, data, fpc)
    @stack.push '('.to_sym
    # puts @stack.inspect
    # puts "LEFT PAREN"
    @last_token_type = :left_paren
  }
  action right_paren_token {
    validate_token(:right_paren, @last_token_type, data, fpc)
    # puts @stack.inspect
    # puts @queue.inspect
    # puts "RIGHT PAREN"
    while(@stack.last != '('.to_sym) do
      if(@stack.empty?) 
        raise ArgumentError, "Mismatched Parentheses"
      end
      @queue << @stack.pop
    end
    @stack.pop
    # puts @stack.inspect
    # puts @queue.inspect
    @last_token_type = :right_paren
  }
  action parse_error {
          position = fpc
          raise ArgumentError, "Bad Input: Parsing terminated before end of buffer" +
              "\nPosition: #{position}" +
              "\nContext:" +
              "\n#{data}"
  }  
	# match an integer or float
	literal = digit+ >mark ('.' digit+)? %number_token;
	# match a reference var or function
	reference = (upper+) >mark %function_or_reference_token;
  # match an argument separator
  separator = ',' >mark %separator_token;
	# match an arithmetic operator
	operator = ('+' | '-' | '*' | '/' | '^' | '>' | '<' | '>=' | 
	            '<=' | 'eq' | 'ne' ) >mark %operator_token;
  left_paren = '(' %left_paren_token;
  right_paren = ')' %right_paren_token;

  main := |* 
    ' ';
    operator;
    literal;
    separator;
    reference;
    left_paren;
    right_paren;
    any => parse_error;
  *|;
}%%

module ExpressionParser
  class ExprMachine
    def initialize
      @queue = []; @stack = []
      @last_token_type = :nil
      @mark = 0;
      %% write data;
    end
    
    def parse(data)
      # puts "PARSING: #{data}"
      # this eof definition is very important
      eof = data.length
      @last_token_type = :nil
      @queue.clear
      @stack.clear
      
      %% write init;
      %% write exec;
    
      while(!@stack.empty?) do
        @queue << @stack.pop
      end
      # puts data
      # puts @queue.inspect
      return @queue
    end
  
    private
    def precedence(token)
      PRECEDENCE[token] || 100
    end
  
    def validate_token(current, previous, context, position)
      unless VALID_TOKEN_TABLE[TOKEN_TYPES[current]][TOKEN_TYPES[previous]]
        raise ArgumentError, %Q{
  Bad Input: #{current} found after #{previous}
  Position: #{position}
  Context:
  #{context}}
      end
    end
    
    FUNCTION_TOKENS = ['CONVOLVE', 'GAUSSIAN', 'ABS', 'CORRELATE']
    
    TOKEN_TYPES = {:nil => 0, :literal => 1, :reference => 2, 
                   :operator => 3, :left_paren => 4, :right_paren => 5,
                   :function => 6, :separator => 7 }
    # shouldn't this be able to be expressed via the ragel language itself?
    # VALID_TOKEN_TABLE[TOKEN_TYPE, PREVIOUS_TOKEN_TYPE]
    VALID_TOKEN_TABLE = [[true, true, true, true, true, true, true, true], # nil
                         [true, false, false, true, true, false, false, true], # literal
                         [true, false, false, true, true, false, false, true], # reference
                         [false, true, true, false, false, true, true, false], # operator
                         [true, false, false, true, true, false, true, true], # left_paren
                         [false, true, true, false, false, true, false, false], # right_paren
                         [true, false, false, true, true, false, false, true], # function
                         [false, true, true, false, false, true, false, false]] # separator

    PRECEDENCE = {'>'.to_sym => 1, '<'.to_sym => 1, '>='.to_sym => 1,
                  '<='.to_sym => 1, 'eq'.to_sym => 1, 'ne'.to_sym => 1,
                  '+'.to_sym => 2, '-'.to_sym => 2, '*'.to_sym => 3, 
                  '/'.to_sym => 3, '^'.to_sym => 4, '('.to_sym => -1 }
  end
end

  # e = Pixelate::ExprMachine.new
  # puts e.parse("3 + 4^2 * 10").inspect
  # e.parse("3 + 4 * 2 / ( 1 - 5 )")
  # puts '-'*80
  # e.parse('A + (1.01*(B - 15.667))/2 + C/(2 + D)')
  # puts '-'*80
  # e.parse('A + 1.5*(another - 1)')
  # puts '-'*80
  # e.parse('A + 1.5*(AN INVALID STATEMENT - 1)')
  



