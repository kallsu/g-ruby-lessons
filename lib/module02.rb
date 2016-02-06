module Alice
  
  # define method1
  def hello()
    puts "Hello I'm Alice"
  end
  
  # define method2
  def bye(name)
    puts "Bye #{name}"
  end
  
end

class Person
  # include Alice Module, it means that all methods of Alice can called by Bob
  include Alice
  
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  # start a conversation
  def start_conversation()
    
    # Can call alice without any keyword
    hello()
    puts "Hi, I am #{@name}. Nice to meet you !"

  end

  # close a conversation   
  def close_conversation()
    bye(@name)
    puts "Bye Alice"
  end
   
end

# create Bob
b = Person.new("Bob")

# start conversation
b.start_conversation()
b.close_conversation()
