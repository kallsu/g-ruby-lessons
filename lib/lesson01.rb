#
# Module with even methods
# 
module Module1
  
  def method1()
    puts "method1()"
  end
  
  def method3()
    puts "method3()"
  end
  
  # module_function is the private intance method that defines methods as instance methods of the module. 
  #
  # The effects of "module_function" are:
  # - it makes class method copies of the specified methods;
  # - it makes the instance methods private;

  module_function :method1, :method3
  
  #
  # Keep it without method names, make all method 'functions'
  #

end

module Module1_1
  
  #
  # Keep it without method names, means that it includes all methods that it has below.
  #
  module_function 
  
  def method1_1()
    puts "method1_1()"
  end
  
  def method1_3()
    puts "method1_3()"
  end

end

#
# Module with odd methods
#
module Module2
  
  #
  # Discourage to use "self" because Module cannot be instantiate
  #
  def self.method2()
    puts "method2()"
  end
  
  def Module2.method4()
    puts "method4()"
  end
end

puts "Ok, let's start"

Module1.method1()
Module1.method3()

puts "--------------"

Module1_1.method1_1()
Module1_1.method1_3()

puts "--------------"

Module2.method2()
Module2.method4()

puts "End of the Game !"
