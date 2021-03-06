# =========================
# Building a Class
# =========================

# Build a class called Name that gives 
# the first name, middle name, last name, and title
# of the person.

class Name
  def title
    "Mr."
  end

  def first_name
    "First"
  end

  def middle_name
    "Middle"
  end

  def last_name
    "Last"
  end
end

name = Name.new
puts name.title
puts name.first_name
puts name.middle_name
puts name.last_name