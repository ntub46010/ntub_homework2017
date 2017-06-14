1.鴨子型別主要注重在於如何使用該類別而不是關注他的類別本身
在使用系統內建類別庫時只需了解如何使用，而不必了解它的內容為何。
就如同只需要知道如何開車，不必了解它運作的原理。

2.`Instance method` 與 `Class method`之間最主要的差異在於`Instance method`必須要建立物件以後，以物件來呼叫方法；
而`Class method`則可以直接以類別來呼叫。  

Instance method

    class Cat
      def nyaa
        puts 'nyaa~'
      end

      cat = Cat.new
      cat.nyaa
    end
Class method

    class Cat
      def self.nyaa
        puts 'nyaa~'
      end

    Cat.nyaa

    end

3.在`Ruby`中，使用`include`繼承`module`的話，該類別所建立的物件可以直接使用繼承的方法但是無法被當作類別方法呼叫；
`extend`則相反，以`extend`繼承`module`的話則只能呼叫類別方法，建立實體以後無法呼叫該繼承`module`的方法。

    module nyaa
      def nyaa
        puts 'nyaa~'
      end
    end
include

    class Cat
      include Nyaa

      cat = Cat.new
      cat.nyaa
    end
extend

class Cat
  extend Nyaa

  Cat.nyaa
end    
