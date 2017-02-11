class HomeController < ApplicationController
  def index
    @random_wiki = Wiki.find(Wiki.pluck(:id).shuffle.first)
  end

  def about
  end
end
