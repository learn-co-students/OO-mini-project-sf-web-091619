class Recipe

    @@all = []

    def initialize
        @@all << self
    end

    def self.most_popular
        mp = RecipeCard.all.map do |rc|
            rc.recipe
        end
        mp.mode
    end

    def users
        RecipeCard.all.select do |rc|
            rc.recipe == self
        end
    end

    def ingredients
        rec = RecipeIngredient.all.select do |ri|
            ri.recipe == self
        end
        rec.map do |recip|
            recip.ingredient
        end
    end

    def allergens
        bad = []
        User.all.each do |user|
            user.allergens.each do |allergen|
                if @ingredients.include?(allergen)
                    bad << allergen
                end
            end
        end
        bad.uniq
    end

    def add_indredients(ingredients)
        ingredients.each do |ing|
            RecipeIngredient.new(self, ing)
        end
    end
        

end