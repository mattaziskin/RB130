# Write a minitest assertion that will fail if the value.odd? is not true.

def test_odd?(value)
  assert value.odd?, 'value is not odd'
end