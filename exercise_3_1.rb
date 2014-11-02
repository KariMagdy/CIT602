# [1] Define a Document class that has 3 attributes (author, title, price)
      #add the ability to read the values, i.e. getters

# [2] Add an addition function that returns a new document that adds the price
#     of the books together, the new document should have for the author field and the title field
#     a string of of comma-separated strings representing the authors and titles respectively
# of the caller and passed document content. (title and author should be the caller's)
# hint: a plus could be used as a funciton name

class Document
	def initialize(author,title,price)
		@author = author 
		@title = title 
		@price = price 
	end
	 
	attr_reader :author
	attr_reader :title
	attr_reader :price
	
	def +(target)
		return Document.new(self.author+ ", " +target.author, self.title+ ", " + target.title, self.price+target.price )
	end
end


# These examples should work
a=Document.new("Dan Brown", "Da Vinci Code", 50)
b=Document.new("Bruce Schneier", "Applied Cryptography", 120)

total = a + b
puts total.price
# 170
puts total.author
# "Dan Brown, Bruce Schneier"
puts total.title
# "Da Vinci Code, Applied Cryptography"

total = total + Document.new("Taha Hussein", "Al-Ayam", 30)

puts total.price
# 200
puts total.author
# "Dan Brown, Bruce Schneier, Taha Hussein"
puts total.title
# "Da Vinci Code, Applied Cryptography, Al-Ayam"


