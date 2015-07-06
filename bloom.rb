require "digest"

set = [0,0,0,0,0,0,0,0]

element = "pizza"

d1 = Digest::MD5.hexdigest(element)
d2 = Digest::SHA1.hexdigest(element)
d3 = Digest::SHA2.hexdigest(element)

index1 = d1.hex % set.length
index2 = d2.hex % set.length
index3 = d3.hex % set.length

puts index1
puts index2
puts index3

set[index1] = 1
set[index2] = 2
set[index3] = 3

