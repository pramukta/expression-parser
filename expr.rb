# line 1 "expr.rl"
# line 78 "expr.rl"


class Expr
  def initialize
    @queue = []
    @stack = []
    @precedence = {'+'.to_sym => 1, '-'.to_sym => 1, '*'.to_sym => 2, 
                   '/'.to_sym => 2, '('.to_sym => -1 }
    @last_token_type = :nil
    @mark = 0;
    
# line 15 "expr.rb"
class << self
	attr_accessor :_expr_actions
	private :_expr_actions, :_expr_actions=
end
self._expr_actions = [
	0, 1, 0, 1, 6, 1, 7, 1, 
	8, 1, 9, 1, 10, 1, 16, 2, 
	1, 12, 2, 2, 13, 2, 3, 11, 
	2, 4, 14, 2, 5, 15, 2, 8, 
	0
]

class << self
	attr_accessor :_expr_key_offsets
	private :_expr_key_offsets, :_expr_key_offsets=
end
self._expr_key_offsets = [
	0, 2, 13, 13, 13, 13, 16, 18
]

class << self
	attr_accessor :_expr_trans_keys
	private :_expr_trans_keys, :_expr_trans_keys=
end
self._expr_trans_keys = [
	48, 57, 32, 40, 41, 45, 47, 42, 
	43, 48, 57, 65, 90, 46, 48, 57, 
	48, 57, 65, 90, 0
]

class << self
	attr_accessor :_expr_single_lengths
	private :_expr_single_lengths, :_expr_single_lengths=
end
self._expr_single_lengths = [
	0, 5, 0, 0, 0, 1, 0, 0
]

class << self
	attr_accessor :_expr_range_lengths
	private :_expr_range_lengths, :_expr_range_lengths=
end
self._expr_range_lengths = [
	1, 3, 0, 0, 0, 1, 1, 1
]

class << self
	attr_accessor :_expr_index_offsets
	private :_expr_index_offsets, :_expr_index_offsets=
end
self._expr_index_offsets = [
	0, 2, 11, 12, 13, 14, 17, 19
]

class << self
	attr_accessor :_expr_trans_targs
	private :_expr_trans_targs, :_expr_trans_targs=
end
self._expr_trans_targs = [
	6, 1, 1, 2, 3, 4, 4, 4, 
	5, 7, 1, 1, 1, 1, 0, 5, 
	1, 6, 1, 7, 1, 1, 1, 1, 
	1, 1, 1, 1, 0
]

class << self
	attr_accessor :_expr_trans_actions
	private :_expr_trans_actions, :_expr_trans_actions=
end
self._expr_trans_actions = [
	0, 13, 9, 0, 0, 1, 1, 1, 
	30, 1, 11, 24, 27, 21, 0, 7, 
	15, 0, 15, 0, 18, 13, 24, 27, 
	21, 15, 15, 18, 0
]

class << self
	attr_accessor :_expr_to_state_actions
	private :_expr_to_state_actions, :_expr_to_state_actions=
end
self._expr_to_state_actions = [
	0, 3, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_expr_from_state_actions
	private :_expr_from_state_actions, :_expr_from_state_actions=
end
self._expr_from_state_actions = [
	0, 5, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_expr_eof_trans
	private :_expr_eof_trans, :_expr_eof_trans=
end
self._expr_eof_trans = [
	22, 0, 23, 24, 25, 27, 27, 28
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

# line 89 "expr.rl"
  end
  
  def parse(data)
    # while !data.empty? do
      data = parse_chunk(data)
      puts data
    # end
  end
  
  def parse(data)
    # this eof definition is very important
    eof = data.length
    @last_token_type = :nil
    
    
    
# line 151 "expr.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = expr_start
	ts = nil
	te = nil
	act = 0
end
# line 105 "expr.rl"
    
# line 162 "expr.rb"
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
			when 7 then
# line 1 "expr.rl"
		begin
ts = p
		end
# line 1 "expr.rl"
# line 193 "expr.rb"
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
 @mark = p 		end
# line 4 "expr.rl"
when 1 then
# line 5 "expr.rl"
		begin
 
    validate_token(:literal, @last_token_type, data, p)
    number = data[@mark..p-1].to_f
    @queue << number
    @mark = nil
    @last_token_type = :literal
    # puts "LOGGING: #{number}"
  		end
# line 5 "expr.rl"
when 2 then
# line 13 "expr.rl"
		begin

    validate_token(:reference, @last_token_type, data, p)
    reference = data[@mark..p-1]
    @queue << reference
    @mark = nil
    @last_token_type = :reference
    # puts "LOGGING: #{reference}"
  		end
# line 13 "expr.rl"
when 3 then
# line 21 "expr.rl"
		begin

    validate_token(:operator, @last_token_type, data, p)
    token = data[@mark..p-1].to_sym
    # puts "LOGGING: #{token}"
    # may need another condition in here
    if(@stack.last)
      if(precedence(token) <= precedence(@stack.last))
        @queue << @stack.pop
      end
    end
    @stack.push(token)
    @last_token_type = :operator
  		end
# line 21 "expr.rl"
when 4 then
# line 34 "expr.rl"
		begin

    validate_token(:left_paren, @last_token_type, data, p)
    @stack.push '('.to_sym
    puts @stack.inspect
    # puts "LEFT PAREN"
    @last_token_type = :left_paren
  		end
# line 34 "expr.rl"
when 5 then
# line 41 "expr.rl"
		begin

    validate_token(:right_paren, @last_token_type, data, p)
    # puts "RIGHT PAREN"
    while(@stack.last != '('.to_sym) do
      if(@stack.empty?) 
        raise ArgumentError, "Mismatched Parentheses"
      end
      @queue << @stack.pop
    end
    @stack.pop
    @last_token_type = :right_paren
  		end
# line 41 "expr.rl"
when 8 then
# line 1 "expr.rl"
		begin
te = p+1
		end
# line 1 "expr.rl"
when 9 then
# line 70 "expr.rl"
		begin
te = p+1
		end
# line 70 "expr.rl"
when 10 then
# line 53 "expr.rl"
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
# line 53 "expr.rl"
when 11 then
# line 71 "expr.rl"
		begin
te = p
p = p - 1;		end
# line 71 "expr.rl"
when 12 then
# line 72 "expr.rl"
		begin
te = p
p = p - 1;		end
# line 72 "expr.rl"
when 13 then
# line 73 "expr.rl"
		begin
te = p
p = p - 1;		end
# line 73 "expr.rl"
when 14 then
# line 74 "expr.rl"
		begin
te = p
p = p - 1;		end
# line 74 "expr.rl"
when 15 then
# line 75 "expr.rl"
		begin
te = p
p = p - 1;		end
# line 75 "expr.rl"
when 16 then
# line 72 "expr.rl"
		begin
 begin p = ((te))-1; end
		end
# line 72 "expr.rl"
# line 393 "expr.rb"
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
when 6 then
# line 1 "expr.rl"
		begin
ts = nil;		end
# line 1 "expr.rl"
# line 414 "expr.rb"
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
# line 106 "expr.rl"
    
    while(!@stack.empty?) do
      @queue << @stack.pop
    end
    puts data
    puts @queue.inspect
  end
  
  def precedence(token)
    @precedence[token] || 100
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
  # VALID_TOKEN_TABLE[TOKEN_TYPE, PREVIOUS_TOKEN_TYPE]
  VALID_TOKEN_TABLE = [[true, true, true, true, true, true], # nil
                       [true, false, false, true, true, false], # literal
                       [true, false, false, true, true, false], # reference
                       [false, true, true, false, false, true], # operator
                       [true, false, false, true, true, false], # left_paren
                       [false, true, true, false, false, true]] # right_paren
end

e = Expr.new
e.parse("3 + 4 * 2 / ( 1 - 5 )")
puts '-'*80
e.parse('A + (1.01*(B - 15.667))/2 + C/(2 + D)')
puts '-'*80
e.parse('A + 1.5*(another - 1)')
e.parse('A + 1.5*(AN INVALID STATEMENT - 1)')






