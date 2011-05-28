require 'flickraw'

class FlickrController < ApplicationController

  def index
    FlickRaw.api_key="4d2513d4eac6cb870158e55e47ed991e"
    FlickRaw.shared_secret="9a93d1aef8f2e83b"
    @list   = flickr.photos.search(:user_id => '56825905@N03')
    
  end


end
