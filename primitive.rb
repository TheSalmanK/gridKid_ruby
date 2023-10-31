class Primitive
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def evaluate(environment = nil)
    self
  end

  def to_s
    @value.to_s
  end
end


class IntegerPrimitive < Primitive
end


class FloatPrimitive < Primitive
end


class BooleanPrimitive < Primitive
end

class StringPrimitive < Primitive
end


