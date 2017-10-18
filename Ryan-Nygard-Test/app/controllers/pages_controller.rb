class PagesController < ApplicationController
  def home    
    @articles = []
    Category.all.each do |x|
      articlesArray = x.articles.last(3)
      articlesArray.each do |article|
       @articles << article
      end
    end
  end
end
