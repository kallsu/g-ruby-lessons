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

class SubPerson < Person
  
  def initialize(name)
    super(name)
  end

  # override this method
  def close_conversation()
    
    puts "Sorry to close this conversation, I have a meeting."
    
    # include a module continues also inside a hierarchy.
    bye(@name)
    puts "Bye Alice"
  end
    
end

# create another person
c = SubPerson.new("Charlie")

# start conversation
c.start_conversation()
c.close_conversation()
