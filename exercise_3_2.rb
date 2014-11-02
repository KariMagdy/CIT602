#[4] Continue in the Document class.
# add a 'words' function that returns the title of the document in the form of
# an array of words.
# Example: if content is "some more content here" then the function should return
# ["some", "more", "content", "here"], if it was a list of documents, it should
# return then as well, ignoring the commans. use your regexp skills if you want.

#[5] add a function each_word that loops on the words in the document - you must use
# blocks
# This function is called like this:
# document.each_word do |word|
#  puts word
# end



class Document
    attr_reader   :author
    attr_reader   :title
    attr_reader   :price
    
    def initialize(author, title, price)
        @author = author
        @title = title
        @price = price
    end
    
    def +(otherObj)
      Document.new("#{@author}, #{otherObj.author}", "#{@title}, #{otherObj.title}", @price+otherObj.price)
    end

    def words
      @title.split(/[\s|,]+/)
    end

    def each_word
      words.each do |w|
        yield w
      end
    end
end


  # These examples should work
  a=Document.new("Dan Brown", "DaVinci Code", 50)
  b=Document.new("Bruce Schneier", "Applied Cryptography", 120)
  
  total = a + b
  total = total + Document.new("Taha Hussein", "Al-Ayam", 30)
  
  puts total.words.to_s
  total.each_word {|w| puts w }



