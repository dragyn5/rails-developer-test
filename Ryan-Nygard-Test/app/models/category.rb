class Category < ApplicationRecord
  has_many :articles
  def self.last_three  
    @articles = []
    Category.all.each do |x|
      x.articles.last(3).each do |article|
        @articles << article
      end
    end
    return @articles
  end
end
