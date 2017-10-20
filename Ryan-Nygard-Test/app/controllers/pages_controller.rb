class PagesController < ApplicationController
  def home    
    @articles = Category.last_three
  end
end
