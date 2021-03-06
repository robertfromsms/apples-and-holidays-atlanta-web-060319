require 'pry'

# given that holiday_hash looks like this:
# {
#   :winter => {
#     :christmas => ["Lights", "Wreath"],
#     :new_years => ["Party Hats"]
#   },
#   :summer => {
#     :fourth_of_july => ["Fireworks", "BBQ"]
#   },
#   :fall => {
#     :thanksgiving => ["Turkey"]
#   },
#   :spring => {
#     :memorial_day => ["BBQ"]
#   }
# }
# return the second element in the 4th of July array

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash.each {|key, value|
    if key == :summer
      return value[:fourth_of_july][1]
    end
  }
end

# holiday_hash is identical to the one above
# add the second argument, which is a supply, to BOTH the
# Christmas AND the New Year's arrays

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each {|key, value|
    if key == :winter
      value.each {|key, value|
        value.push(supply)
      }
    end
  }
end

# again, holiday_hash is the same as the ones above
# add the second argument to the memorial day array

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each {|key, value|
    if key == :spring
      value.each {|key, value|
        value.push(supply)
      }
    end
  }

end

# code here
# remember to return the updated hash

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
end

# return an array of all of the supplies that are used in the winter season

def all_winter_holiday_supplies(holiday_hash)
  supplies = []
  holiday_hash.each {|season, holiday_name|
    holiday_name.each {|holiday_name, supply|
      supplies.push(supply)
    }
  }
  return supplies.flatten
end

# iterate through holiday_hash and print items such that your readout resembles:
# Winter:
#   Christmas: Lights, Wreath
#   New Years: Party Hats
# Summer:
#   Fourth Of July: Fireworks, BBQ
# etc.


def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each {|season, holiday_name|
    puts season.to_s.capitalize + ":"
    holiday_name.each {|holiday_name, supply|
      puts "  " + holiday_name.to_s.split("_").collect {|word| word.capitalize}.join(" ") + ": " + supply.join(", ")
    }
  }
end

# return an array of holiday names (as symbols) where supply lists
# include the string "BBQ"

def all_holidays_with_bbq(holiday_hash)
  answer = []
  holiday_hash.each {|season, holiday_name|
    holiday_name.each {|holiday_name, supply|
      if supply.any? {|item| item == "BBQ"}
        answer.push(holiday_name)
      end
    }
  }
  return answer
end
