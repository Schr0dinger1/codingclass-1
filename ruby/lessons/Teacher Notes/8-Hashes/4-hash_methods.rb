# =========================
# Hash Methods
# =========================

# We will continue with the hash from before:

hash = { "item" => "apple", "quantity" => 1, "type" => "Gala" }
puts hash.inspect

# The #length method will return the 
# number of keys in the hash. In this case, it would be 3:

puts hash.length

# The #invert method returns a new hash with 
# the keys and values switched:

puts hash.invert
# => {"apple" => "item", 1 => "quantity", "Gala" => "type"}

# The #shift method works similar to 
# hashes as it does with arrays. 
# It will remove a key and value pair 
# from the hash and return it as an array:

puts hash.shift
# => ["item", "Bread"] (note it's an array)

# Inspect the original hash to see it modified:

puts hash.inspect
# => {"quantity" => 1, "type" => "Gala"}

# The #merge method combines the hash sent 
# in as an argument and returns a new hash 
# with the two combined:

puts hash.merge({ "calories" => 100 })

# If any key value pairs exist in the 
# original hash, the merge method will 
# overwrite those:

hash.merge({"quantity" => 100})

# You will see the quantity overwritten.
puts hash.inspect