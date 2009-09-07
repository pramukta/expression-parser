require 'expr'
require 'default_functions'
module ExpressionParser
  class DefaultExprMachine < ExprMachine
    include DefaultFunctionTokens
  end
end