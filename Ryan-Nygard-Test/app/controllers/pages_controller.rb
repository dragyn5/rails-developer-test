class PagesController < ApplicationController
  def home    
    @articles = []
    Category.all.each do |x|
      articlesArray = x.articles[0..2]
      articlesArray.each do |article|
       @articles << article
      end
    end
  end
end
