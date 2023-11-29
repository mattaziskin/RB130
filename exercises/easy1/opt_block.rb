=begin

Write a method that takes an optional block. If the block is specified, the
method should execute it, and return the value returned by the block. If no
block is specified, the method should simply return the String
'Does not compute.'.

=end

def compute
  if block_given?
    yield
  else
    "Does not compute."
  end
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

def arg_compute(arg)
  return arg unless block_given?
  yield(arg)
end