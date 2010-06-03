require 'bundler'
Bundler.require(:default)

module Workshop
  class Application < Sinatra::Base
    enable :static
    set :path, File.join(File.dirname(__FILE__), 'views')
    set :public, File.join(File.dirname(__FILE__), 'public')

    helpers do
      def sold_out?
        event_details = JSON.parse(RestClient.get(ENV["SYDNEY_EVENT_URI"]))
        seats_remaining = event_details["event_sessions"].first["capacity"].to_i - event_details["event_sessions"].first["attendees"].length.to_i

        (seats_remaining == 0) ? true : false
      end
    end

    get '/' do
      erb :index
    end
  end
end
