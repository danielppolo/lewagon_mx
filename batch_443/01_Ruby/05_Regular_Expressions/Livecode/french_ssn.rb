require 'date'
require 'yaml'
# Gender (1 == man, 2 == woman)
# Year of birth (84)
# Month of birth (12)
# Department of birth (76, basically included between 01 and 99)
# 6 random digits (451 089)
# A 2 digits key (46, equal to the remainder of the division of (97 - ssn_without_key) by 97.)

def french_ssn_info(ssn_number)
  pattern = /^(?<gender>1|2)\s(?<year>\d{2})\s(?<month>0[1-9]|1[0-2])\s(?<department>\d{2})\s\d{3}\s\d{3}\s(?<key>\d{2})$/
  match = ssn_number.match(pattern)
  # 1. Check if key is correct => SSN valid?
  # 2. Sum up all the numbers but the last....
  if match && valid_ssn?(ssn_number, match[:key])
    # 3. Get the gender string
    gender = match[:gender] == '1' ? 'man' : 'woman'
    # 4. Get the month as string
    month_index = match[:month].to_i
    month = Date::MONTHNAMES[month_index]
    # 5. Get the full year
    year = match[:year]
    complete_year = "19#{year}"

    # 6. Get the department
    file = YAML.load_file('data/french_departments.yml')
    department = file[match[:department]] # file["93"]
    return "a #{gender}, born in #{month}, #{complete_year} in #{department}."
  else
    return "The number is invalid" 
  end

end

def valid_ssn?(ssn, key)
  ssn_first_part = ssn[0..-3].gsub(' ', '').to_i
  return (97 - ssn_first_part) % 97 == key.to_i
end

