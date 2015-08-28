# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

puts "What would you like to do?\n To find ID 1, please enter a \"find 1\". \n To list all candidates, enter \"all\".\n To view qualified candidates, enter \"qualified\".\n To leave program, enter \"quit\"." 
@user_input = gets.chomp 

def menu()
  case @user_input 
  when /find (\d+)/

    id = @user_input.match(/find (\d+)/)[1].to_i
    puts find(id)
  when "all"
     puts @candidates
  when "qualified"
     puts qualified_candidates()
  when "quit"
     puts "Goodbye bye"
      return quit
  else 
    puts "Not available"
  end
end            

  def find(ids)
    @candidates.each do |candidate|
      if candidate[:id] == ids
        return candidate 
      end
    end
  return nil
end

# puts find(@user_input)


def experienced?(candidat)
    return candidat[:years_of_experience] >= 2
end

def github?(candidat)
    return candidat[:github_points] >= 100
end

def lang_requirements(key)
    # if key[:id] == 9
    #   binding.pry
    # end  
    return key[:languages].include?(('Ruby') || ('Python'))
end

def applied?(candidat)
    return candidat[:date_applied] >= 15
end

def age?(candidat)
    return candidat[:age] > 18
end


def qualified_candidates()
  arr = []
  @candidates.each do |person|
    if (experienced?(person) && github?(person) && applied?(person) && age?(person) && lang_requirements(person))
    # if (lang_requirements(person))
      arr.push(person)
    end
  end
  arr
end
# qualified_candidates()

def ordered_by_qualifications()
  puts @candidates.sort_by {|order| [order[:years_of_experience], order[:github_points]]}.reverse
end
# ordered_by_qualifications()
