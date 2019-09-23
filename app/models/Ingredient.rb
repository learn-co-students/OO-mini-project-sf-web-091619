class Ingredient

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_common_allergy
        al = Allergy.all.map do |allergy|
            allergy.ingredient
        end
        al.mode
    end

end
