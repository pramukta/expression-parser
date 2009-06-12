require 'default_operations'
require 'default_functions'
require 'blank_interpreter'

module ExpressionParser
  class DefaultInterpreter < BlankInterpreter
    include DefaultOperations
    include DefaultFunctions
  end
end

