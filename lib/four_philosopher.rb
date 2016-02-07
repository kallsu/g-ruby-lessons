require 'thread'
require 'singleton'

#
# Thread example referred to problem of 4 dining philosophers.
#

#
# Table object class
#
class Table
  include Singleton
  def initialize()
    @forket = 4
    @seats = Array.new(4)

    # use mutex
    @mutex = Mutex.new()
  end

  def sit_on_table(philo)

    printf "enter #{philo.name} \n"

    # check seat
    if(philo.seated == false && @forket > 0)

      # test-test and set approach
      @mutex.synchronize {

        # check again
        if(philo.seated == false && @forket > 0)
          @forket -= 2
          @seats.push(philo)

          philo.seated = true

          printf "#{philo.name} is seated \n"
        end
      }

    else

      # synchronize
      @mutex.synchronize {

        index = 0

        # iterate on seats
        while(index > -1) do

          # remove the 1st one that you encounter
          if(@seats[index] != nil && @seats[index].seated == true)
            @seats[index].seated = false
            break

          else
            index +=1
          end
        end

        printf "Removed philosopher #{@seats[index].name} at #{index} seat\n"

        # remove philo
        @seats.delete_at(index)

        # add forket
        @forket += 2
      }
    end
  end

end

#
# Philosopher object class
#
class Philo

  attr_accessor :seated
  attr_reader :name
  def initialize(pname)

    # check input
    pname.untaint if(pname != nil && pname.tainted? && pname.instance_of(String) && pname != "" )

    @name = pname
    @seated = false
  end

  def sit(table)
    # wait 1 second ( because of we are polite )

    while( true ) do
      begin
        # wait 1 second
        sleep(1)

        # go to table
        table.sit_on_table(self)

      rescue Exception => e
        printf "#{self.name} raise this exception #{e}\n"
      end
    end
  end

  def to_s()
    "#Philo {@name} : #{@seated}"
  end
end

# counter
counter = 10

table = Table.instance

p1 = Philo.new("p_1")
p2 = Philo.new("p_2")
p3 = Philo.new("p_3")
p4 = Philo.new("p_4")

t1 = Thread.new() {
  p1.sit(table)
}

t2 = Thread.new() {
  p2.sit(table)
}

t3 = Thread.new() {
  p3.sit(table)
}

t4 = Thread.new() {
  p4.sit(table)
}

counter = 100

# termination clause
t1.abort_on_exception=true
t2.abort_on_exception=true
t3.abort_on_exception=true
t4.abort_on_exception=true

# start
t_array = [t1, t2, t3, t4]
t_array.each {|t| t.join; }
