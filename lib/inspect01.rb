#
# Module to be inspected.
#
# Phantom Blot ( https://en.wikipedia.org/wiki/Phantom_Blot )
#
module Phantom_Blot
  def Phantom_Blot.run()
    puts "Run"
  end

  def Phantom_Blot.steal(object)
    puts "#{object.to_s} was stolen"
  end

  def Phantom_Blot.who_call_me()
    cc = caller()
    puts "Called by: " << cc[0]
  end
end

#
# The chief.
#
class Chief_Seamus_OHara
  def initialize()
    # nothing to do
  end

  # check phantom
  def check_phantom()
    puts "Check Phantom"

    Phantom_Blot.who_call_me()

    puts "Phantom checked"
  end

  # inspect phantom
  def inspect_phantom()
    puts "Inspect Phantom"

    m = Phantom_Blot.methods(true).sort
    m.each {|method| puts "#{method}\n"}
      
    puts "Phantom inspected"
  end
  
  # auto inspect
  def inspect_myself()
    puts "Inspect myself"

    m = self.methods(true).sort
    m.each {|method| puts "#{method}\n"}
      
    puts "Myself inspected"
  end

end

cs = Chief_Seamus_OHara.new()

# check phantom
cs.check_phantom()

# insect
cs.inspect_phantom()

# inspect myself
cs.inspect_myself()