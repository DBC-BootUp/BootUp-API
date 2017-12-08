class FrontendController < ApplicationController
  def index
    render file: '/public/build/index.html'
  end
end
