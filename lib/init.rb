class Init
  def init_call_func_name
    break_condition = "Choose: \n" \
                      "\t1 - meters to miles\n" \
                      "\t2 - meters to kilometers\n" \
                      "\t3 - kilometers to miles\n" \
                      "\t4 - kilometers to meters\n" \
                      "\t5 - miles to meters\n" \
                      "\t6 - miles to kilometers\n" \
                      "Value must be >= 1 and <= 6. 'q' to quit\n"
    init('check_call_func_name?', break_condition)
  end

  def init_value
    break_condition = "=======================\n" \
                      "Value must be > 0. 'q' to quit"
    init('check_value?', break_condition)
  end

  def quit?(message)
    message.downcase == 'q'
  end

  private

  def init(break_condition_func_name, break_condition = '')
    value = ''
    loop do
      puts break_condition
      puts 'Enter value: '
      value = type_value
      break if send(break_condition_func_name, value) || quit?(value)
    end
    value
  end

  def type_value
    gets.to_s.chomp
  end

  def check_value?(value)
    value.to_f.positive?
  end

  def check_call_func_name?(call_func_name)
    call_func_name.to_i >= 1 and call_func_name.to_i <= 6
  end
end
