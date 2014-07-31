require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    "I liek u: #{ENV.fetch('NAME_OF_GUY', 'Nohbody')}"
  end
end
