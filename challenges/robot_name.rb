class Robot
  attr_reader :name

  @@selected_names = []

  def initialize
    @name = random_name
  end

  def random_name
    name_in_progress = ''
    loop do
      2.times { |_| name_in_progress << ('A'..'Z').to_a.sample }
      3.times { |_| name_in_progress << ('0'..'9').to_a.sample }
      name_in_progress = '' if invalid_name?(name_in_progress)
      break if name_in_progress != ''
    end
    @@selected_names << name_in_progress
    @name = name_in_progress
  end

  def invalid_name?(name_in_progress)
    name_in_progress == name || @@selected_names.include?(name_in_progress)
  end

  def reset
    @@selected_names.delete(name)
    random_name
  end
end
