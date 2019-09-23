class User
    ​
    @@all = []
​
    def initialize
        @@all << self
    end
​
    def recipes
        rc = RecipeCard.all.select do |rc|
            rc.user == self
        end
        rc.map do |rec|
            rec.recipe 
        end
    end
​
    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(recipe, date, rating, self)
    end
​
    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end
​
    def allergens
        allergies = Allergy.all.select do |allergy|
            allergy.user == self
        end
        allergies.map do |allergy|
            allergy.ingredient
        end
    end
​
    def top_three_recipes
        rec = RecipeCard.all.select do |rc|
            rc.user == self
        end
        rats = rec.sort_by do |recs|
            recs.rating
        end
            rats.reverse(0..2)
    end
​
    def most_recent_recipe
        date_max = RecipeCard[0]
        RecipeCard.all.each do |rc|
            if rc.date > date_max.date
                date_max = rc
            end
        end
        date_max.recipe
    end
​
    def self.all
        @@all
    end
​
    def safe_recipes
        algs = Allergy.all.select do |alg|
            alg.user == self
        end
        ings = algs.map do |al|
            al.ingredient
        end
        good_rec = []
        Recipe.all.each do |rec|
            good = true
            rec.ingredients.each do |ing|
                if ings.include?(ing)
                    good = false
                end
            end
            if good 
                good_rec << rec
            end
        end
    end
​
​
​
end