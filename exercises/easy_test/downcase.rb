

# Write a minitest assertion that will fail if
# value.downcase does not return 'xyz'.

def test_downcase
  assert_equal('xyz', "XYZ".downcase)
end

p test_downcase