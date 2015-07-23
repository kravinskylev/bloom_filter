require "digest"
# brett rules
class BloomFilter
  attr_accessor :element, :set

  def initialize
    @set = [0,0,0,0,0,0,0,0]
  end

  def add(element)
    digest(element)
    modulate
    binary
    return @set
  end

  def digest(element)
    @d1 = Digest::MD5.hexdigest(element)
    @d2 = Digest::SHA1.hexdigest(element)
    @d3 = Digest::SHA2.hexdigest(element)
  end

  def modulate
    @index1 = @d1.hex % @set.length
    @index2 = @d2.hex % @set.length
    @index3 = @d3.hex % @set.length
  end

  def binary
    @set[@index1] = 1
    @set[@index2] = 1
    @set[@index3] = 1
  end

  def presence?(element)
    filter = BloomFilter.new
    if filter.add(element) == @set
      puts "that element is in the set"
    else
      puts "I dunno if it's there"
    end
  end
end

bf = BloomFilter.new
bf.add("abc")
bf.add("overlap")
bf.presence?("abc")
bf.presence?("shampow")


#set = [0,0,0,0,0,0,0,0]
#
#element = "pizza"
#
#d1 = Digest::MD5.hexdigest(element)
#d2 = Digest::SHA1.hexdigest(element)
#d3 = Digest::SHA2.hexdigest(element)
#
#index1 = d1.hex % set.length
#index2 = d2.hex % set.length
#index3 = d3.hex % set.length
#
##puts index1
##puts index2
##puts index3
#
#set[index1] = 1
#set[index2] = 1
#set[index3] = 1

#p set
#

#class BloomFilter
#  attr_accessor :element, :set
#
#  def initialize
#    @set = "00000000".to_i(2)
#  end
#
#  def add(element)
#    digest(element)
#    modulate
#    binary
#  end
#
#  def digest(element)
#    @d1 = Digest::MD5.hexdigest(element)
#    @d2 = Digest::SHA1.hexdigest(element)
#    @d3 = Digest::SHA2.hexdigest(element)
#  end
#
#  def modulate
#    @index1 = @d1.hex % 8
#    @index2 = @d2.hex % 8
#    @index3 = @d3.hex % 8
#  end
#
#  def binary
#    value1 = @set | "#{@index1}".to_i(2)
#    value2 = @set | "#{@index2}".to_i(2)
#    value3 = @set | "#{@index3}".to_i(2)
#    set = value1.to_s + value2.to_s + value3.to_s
#    print set + "\n"
#  end
#
#  def presence?(element)
#    filter = BloomFilter.new
#    if filter.add(element) == @set
#      puts "that element is in the set"
#    else
#      puts "I dunno if it's there"
#    end
#  end
#end
#
#bf = BloomFilter.new
#bf.add("wow")
#bf.presence?("nope")
