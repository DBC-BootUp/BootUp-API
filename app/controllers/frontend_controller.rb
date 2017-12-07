class FrontendController < ApplicationController
  def show
    render file: '/public/react_entry_point.html'
  end
end
