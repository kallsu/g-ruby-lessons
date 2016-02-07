#
#
#

printf "Hello, you are ready to play in this game (yes/no)?\n"

# 'chomp' method returns a new string and it removes carriage return characters (that is it will remove \n, \r, and \r\n).
response = gets.chomp

# 'strip' method returns a copy of str with leading and trailing whitespace removed.
# and make all upper case
response = response.strip.upcase    # put separately to understand the concept

# check input
if(response.tainted?) then
  printf "<DEBUG> this input variable is tainted. Need to check better.\n"
  
  # check if it isn't empty string or nil (null)
  # if yes remove taint state from variable and freeze it ( I respect your choice )
  response.untaint if(response != nil && response.to_s != '')
end

printf "<DEBUG> Variable is still tainted ? #{response.tainted?} :: #{response}\n"

# use case instead of if / elsif / else
case
when response === "YES" then printf "Thanks to accept !\nGame endds here !\n\n"
   
when response === "NO" then 
  printf "Thenks for your answer.\nSee you next time. Bye Bye\n\n"
  exit 0

else 
  # only exit I didn't create the loop to repeat right command
  printf "Sorry Sir, I didn't understand your answer, you can answer only yes or no. Try another time. Bye\n\n"
  exit -1
end

