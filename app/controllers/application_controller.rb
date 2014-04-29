class ApplicationController < ActionController::Base
  protect_from_forgery

  def location
    if params[:location].blank?
      if Rails.env.test? || Rails.env.development?
        @location ||= Geocoder.search("72.208.10.211").first
      else
        @location ||= request.location
      end
    else
      params[:location].each {|i| i = i.to_i} if params[:location].is_a? Array
      @location ||= Geocoder.search(params[:location]).first
      @location
    end
  end

end
