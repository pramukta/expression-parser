# line 1 "expr.rl"
# line 117 "expr.rl"


module ExpressionParser
  class ExprMachine
    def initialize
      @queue = []; @stack = []
      @last_token_type = :nil
      @mark = 0;
      
# line 13 "expr.rb"
class << self
	attr_accessor :_expr_actions
	private :_expr_actions, :_expr_actions=
end
self._expr_actions = [
	0, 1, 0, 1, 7, 1, 8, 1, 
	9, 1, 10, 1, 11, 1, 18, 1, 
	19, 2, 1, 14, 2, 2, 12, 2, 
	3, 15, 2, 4, 13, 2, 5, 16, 
	2, 6, 17, 2, 9, 0
]

class << self
	attr_accessor :_expr_key_offsets
	private :_expr_key_offsets, :_expr_key_offsets=
end
self._expr_key_offsets = [
	0, 2, 18, 18, 18, 18, 18, 21, 
	23, 24, 26, 27
]

class << self
	attr_accessor :_expr_trans_keys
	private :_expr_trans_keys, :_expr_trans_keys=
end
self._expr_trans_keys = [
	48, 57, 32, 40, 41, 44, 47, 60, 
	62, 94, 101, 110, 42, 45, 48, 57, 
	65, 90, 46, 48, 57, 48, 57, 61, 
	65, 90, 113, 101, 0
]

class << self
	attr_accessor :_expr_single_lengths
	private :_expr_single_lengths, :_expr_single_lengths=
end
self._expr_single_lengths = [
	0, 10, 0, 0, 0, 0, 1, 0, 
	1, 0, 1, 1
]

class << self
	attr_accessor :_expr_range_lengths
	private :_expr_range_lengths, :_expr_range_lengths=
end
self._expr_range_lengths = [
	1, 3, 0, 0, 0, 0, 1, 1, 
	0, 1, 0, 0
]

class << self
	attr_accessor :_expr_index_offsets
	private :_expr_index_offsets, :_expr_index_offsets=
end
self._expr_index_offsets = [
	0, 2, 16, 17, 18, 19, 20, 23, 
	25, 27, 29, 31
]

class << self
	attr_accessor :_expr_trans_targs
	private :_expr_trans_targs, :_expr_trans_targs=
end
self._expr_trans_targs = [
	7, 1, 1, 2, 3, 5, 4, 8, 
	8, 4, 10, 11, 4, 6, 9, 1, 
	1, 1, 1, 1, 0, 6, 1, 7, 
	1, 4, 1, 9, 1, 4, 1, 4, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 0
]

class << self
	attr_accessor :_expr_trans_actions
	private :_expr_trans_actions, :_expr_trans_actions=
end
self._expr_trans_actions = [
	0, 15, 9, 0, 0, 1, 1, 1, 
	1, 1, 1, 1, 1, 35, 1, 11, 
	29, 32, 26, 17, 0, 7, 20, 0, 
	20, 0, 26, 0, 23, 0, 13, 0, 
	13, 15, 29, 32, 26, 17, 20, 20, 
	26, 23, 13, 13, 0
]

class << self
	attr_accessor :_expr_to_state_actions
	private :_expr_to_state_actions, :_expr_to_state_actions=
end
self._expr_to_state_actions = [
	0, 3, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0
]

class << self
	attr_accessor :_expr_from_state_actions
	private :_expr_from_state_actions, :_expr_from_state_actions=
end
self._expr_from_state_actions = [
	0, 5, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0
]

class << self
	attr_accessor :_expr_eof_trans
	private :_expr_eof_trans, :_expr_eof_trans=
end
self._expr_eof_trans = [
	34, 0, 35, 36, 41, 38, 40, 40, 
	41, 42, 44, 44
]

class << self
	attr_accessor :expr_start
end
self.expr_start = 1;
class << self
	attr_accessor :expr_first_final
end
self.expr_first_final = 1;
class << self
	attr_accessor :expr_error
end
self.expr_error = -1;

class << self
	attr_accessor :expr_en_main
end
self.expr_en_main = 1;

# line 126 "expr.rl"
    end
    
    def parse(data)
      # puts "PARSING: #{data}"
      # this eof definition is very important
      eof = data.length
      @last_token_type = :nil
      @queue.clear
      @stack.clear
      
      
# line 156 "expr.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = expr_start
	ts = nil
	te = nil
	act = 0
end
# line 137 "expr.rl"
      
# line 167 "expr.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	end
	if _goto_level <= _resume
	_acts = _expr_from_state_actions[cs]
	_nacts = _expr_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _expr_actions[_acts - 1]
			when 8 then
# line 1 "expr.rl"
		begin
ts = p
		end
# line 1 "expr.rl"
# line 198 "expr.rb"
		end # from state action switch
	end
	if _trigger_goto
		next
	end
	_keys = _expr_key_offsets[cs]
	_trans = _expr_index_offsets[cs]
	_klen = _expr_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p] < _expr_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p] > _expr_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _expr_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p] < _expr_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p] > _expr_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	end
	if _goto_level <= _eof_trans
	cs = _expr_trans_targs[_trans]
	if _expr_trans_actions[_trans] != 0
		_acts = _expr_trans_actions[_trans]
		_nacts = _expr_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _expr_actions[_acts - 1]
when 0 then
# line 4 "expr.rl"
		begin
 
	  @mark = p 
	  # puts @stack.inspect
	  # puts @queue.inspect
			end
# line 4 "expr.rl"
when 1 then
# line 10 "expr.rl"
		begin

    validate_token(:separator, @last_token_type, data, p)
    while(@stack.last != '('.to_sym) do
      if(@stack.empty?) 
        raise ArgumentError, "Mismatched Parentheses"
      end
      @queue << @stack.pop
    end
    @mark = nil
    @last_token_type = :separator
  		end
# line 10 "expr.rl"
when 2 then
# line 22 "expr.rl"
		begin
 
    validate_token(:literal, @last_token_type, data, p)
    number = data[@mark..p-1].to_f
    @queue << number
    @mark = nil
    @last_token_type = :literal
    # puts "LOGGING: #{number}"
  		end
# line 22 "expr.rl"
when 3 then
# line 30 "expr.rl"
		begin

    reference = data[@mark..p-1]
    if functions.include?(reference.downcase.to_sym)
      validate_token(:function, @last_token_type, data, p)
      @stack.push reference.downcase.to_sym
      @last_token_type = :function
    else
      validate_token(:reference, @last_token_type, data, p)
      @queue << reference
      @last_token_type = :reference
    end
    @mark = nil
    # puts "LOGGING: #{reference}"
    # puts "LOGGING: #{@stack.inspect}"
    # puts "LOGGING: #{@queue.inspect}"
  		end
# line 30 "expr.rl"
when 4 then
# line 46 "expr.rl"
		begin

    validate_token(:operator, @last_token_type, data, p)
    token = data[@mark..p-1].to_sym
    # puts "LOGGING: #{token}"
    # I think this is actually the correct condition
    while(PRECEDENCE.keys.include?(@stack.last) || functions.include?(@stack.last))
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
  		end
# line 46 "expr.rl"
when 5 then
# line 65 "expr.rl"
		begin

    validate_token(:left_paren, @last_token_type, data, p)
    @stack.push '('.to_sym
    # puts @stack.inspect
    # puts "LEFT PAREN"
    @last_token_type = :left_paren
  		end
# line 65 "expr.rl"
when 6 then
# line 72 "expr.rl"
		begin

    validate_token(:right_paren, @last_token_type, data, p)
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
  		end
# line 72 "expr.rl"
when 9 then
# line 1 "expr.rl"
		begin
te = p+1
		end
# line 1 "expr.rl"
when 10 then
# line 108 "expr.rl"
		begin
te = p+1
		end
# line 108 "expr.rl"
when 11 then
# line 88 "expr.rl"
		begin
te = p+1
 begin 
          position = p
          raise ArgumentError, "Bad Input: Parsing terminated before end of buffer" +
              "\nPosition: #{position}" +
              "\nContext:" +
              "\n#{data}"
   end
		end
# line 88 "expr.rl"
when 12 then
# line 109 "expr.rl"
		begin
te = p
p = p - 1;		end
# line 109 "expr.rl"
when 13 then
# line 110 "expr.rl"
		begin
te = p
p = p - 1;		end
# line 110 "expr.rl"
when 14 then
# line 111 "expr.rl"
		begin
te = p
p = p - 1;		end
# line 111 "expr.rl"
when 15 then
# line 112 "expr.rl"
		begin
te = p
p = p - 1;		end
# line 112 "expr.rl"
when 16 then
# line 113 "expr.rl"
		begin
te = p
p = p - 1;		end
# line 113 "expr.rl"
when 17 then
# line 114 "expr.rl"
		begin
te = p
p = p - 1;		end
# line 114 "expr.rl"
when 18 then
# line 88 "expr.rl"
		begin
te = p
p = p - 1; begin 
          position = p
          raise ArgumentError, "Bad Input: Parsing terminated before end of buffer" +
              "\nPosition: #{position}" +
              "\nContext:" +
              "\n#{data}"
   end
		end
# line 88 "expr.rl"
when 19 then
# line 109 "expr.rl"
		begin
 begin p = ((te))-1; end
		end
# line 109 "expr.rl"
# line 454 "expr.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	_acts = _expr_to_state_actions[cs]
	_nacts = _expr_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _expr_actions[_acts - 1]
when 7 then
# line 1 "expr.rl"
		begin
ts = nil;		end
# line 1 "expr.rl"
# line 475 "expr.rb"
		end # to state action switch
	end
	if _trigger_goto
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	if _expr_eof_trans[cs] > 0
		_trans = _expr_eof_trans[cs] - 1;
		_goto_level = _eof_trans
		next;
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end
# line 138 "expr.rl"
    
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
  



