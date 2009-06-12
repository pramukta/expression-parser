require 'default_operations'
require 'default_functions'
require 'blank_interpreter'

module Pixelate
  class DefaultInterpreter < BlankInterpreter
    include DefaultOperations
    include DefaultFunctions
  end
end

