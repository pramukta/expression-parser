module Pixelate
  module DefaultOperations
    def operators
      [:+, :-, :*, :/, '^'.to_sym]
    end
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