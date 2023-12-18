class PerfectNumber

  def self.classify(num)
    raise StandardError if num < 0
    return 'perfect' if perfect?(num)
    return 'abundant' if abundant?(num)
    return 'deficient' if deficient?(num)
  end

  private

  def self.divisors(num)
    (1...num).to_a.select { |n| num % n == 0 }
  end

  def self.perfect?(num)
    divisors(num).sum == num
  end

  def self.abundant?(num)
    divisors(num).sum > num
  end

  def self.deficient?(num)
    divisors(num).sum < num
  end
end

p PerfectNumber.classify(8)