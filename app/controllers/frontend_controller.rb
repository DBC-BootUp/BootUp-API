class FrontendController < ApplicationController
  def index
    render file: '/public/react_entry_point.html'
  end
end
