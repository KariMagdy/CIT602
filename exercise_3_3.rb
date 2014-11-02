# Mixing in modules
#[6] we would like to add a function that replaces a word with another
# replace_word(old_word, new_word)

#Metaprogramming
#[7] instead of calling document.replace_word(old,new) we would like to be able to
# do something like this: document.replace_book('pen') where book is the old word
# and pen is the new word. This should work on any word (not just book).
# hint:  'method_missing'

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
    
    def replace_word(old_word, new_word)
    	@title.gsub!(old_word,new_word)
    end 
    
    def method_missing(name,*args,&block)
    	if name.match(/(^replace_)(.+)/)
    		@title.gsub!($2,args[0])
    	end
    end
end


a=Document.new("Dan Brown", "DaVinci Code", 50)
b=Document.new("Bruce Schneier", "Applied Cryptography", 120)

puts a.title
a.replace_Code("hello")
puts a.title
