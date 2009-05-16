%%{
	machine expr;
	
	action mark { @mark = fpc }
  action number_token { 
    validate_token(:literal, @last_token_type, data, fpc)
    number = data[@mark..fpc-1].to_f
    @queue << number
    @mark = nil
    @last_token_type = :literal
    # puts "LOGGING: #{number}"
  }
  action reference_token {
    validate_token(:reference, @last_token_type, data, fpc)
    reference = data[@mark..fpc-1]
    @queue << reference
    @mark = nil
    @last_token_type = :reference
    # puts "LOGGING: #{reference}"
  }
  action operator_token {
    validate_token(:operator, @last_token_type, data, fpc)
    token = data[@mark..fpc-1].to_sym
    # puts "LOGGING: #{token}"
    # may need another condition in here
    if(@stack.last)
      if(precedence(token) <= precedence(@stack.last))
        @queue << @stack.pop
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
    # puts "RIGHT PAREN"
    while(@stack.last != '('.to_sym) do
      if(@stack.empty?) 
        raise ArgumentError, "Mismatched Parentheses"
      end
      @queue << @stack.pop
    end
    @stack.pop
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
	# match a reference var
	reference = (upper+) >mark %reference_token;
	# match an arithmetic operator
	operator = ('+' | '-' | '*' | '/' | '^' ) >mark %operator_token;
  left_paren = '(' %left_paren_token;
  right_paren = ')' %right_paren_token;
  
  main := |* 
    ' ';
    operator;
    literal;
    reference;
    left_paren;
    right_paren;
    any => parse_error;
  *|;
}%%

module Pixelate
  class ExprMachine
    def initialize
      @queue = []; @stack = []
      @last_token_type = :nil
      @mark = 0;
      %% write data;
    end
    
    def parse(data)
      # this eof definition is very important
      eof = data.length
      @last_token_type = :nil
      @queue.clear
    
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
  
    TOKEN_TYPES = {:nil => 0, :literal => 1, :reference => 2, 
                   :operator => 3, :left_paren => 4, :right_paren => 5 }
    # shouldn't this be able to be expressed via the ragel language itself?
    # VALID_TOKEN_TABLE[TOKEN_TYPE, PREVIOUS_TOKEN_TYPE]
    VALID_TOKEN_TABLE = [[true, true, true, true, true, true], # nil
                         [true, false, false, true, true, false], # literal
                         [true, false, false, true, true, false], # reference
                         [false, true, true, false, false, true], # operator
                         [true, false, false, true, true, false], # left_paren
                         [false, true, true, false, false, true]] # right_paren

    PRECEDENCE = {'+'.to_sym => 1, '-'.to_sym => 1, '*'.to_sym => 2, 
                  '/'.to_sym => 2, '^'.to_sym => 3, '('.to_sym => -1 }
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
  



