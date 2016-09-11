class HomeController < ApplicationController
  def index
    conn = Faraday.new(url: 'http://uifaces.com')
    response = conn.get('/api/v1/random')
    @avatar_url = JSON.parse(response.body)["image_urls"]["epic"]

    respond_to do |format|
      format.html { render :index }
      format.json { render json: { img: @avatar_url } }
    end

  end
end
