module QBlog
	class App < Sinatra::Base
		set :root, File.expand_path("../../../", __FILE__)

		get '/' do
			haml :index
		end
	end
end
