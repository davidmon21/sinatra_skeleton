require 'sinatra'
require 'securerandom'
require 'rack/attack'
require 'rack-protection'
module Skeleton
    class Server < Sinatra::Base
        set :root, Dir.pwd
        configure do
            Skeleton::SkeletonController::init( )
        end
        session_key = SecureRandom.hex(64)
        enable :sessions
        set :session_secret, session_key
        use Rack::Protection
        use Rack::Attack
        Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
        use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => session_key
        Rack::Attack.safelist('allow from localhost') do |req|
            '127.0.0.1' == req.ip || '::1' == req.ip
        end
        # Rack::Attack.throttle("requests by ip", limit: 4, period: 1) do |request|
        #     if request.path == "/reply" || request.path == "/create_op"
        #         puts request.ip
        #         request.ip
        #     end
        # end
        get '/' do
            erb :index
        end

        get '/style.scss' do
            scss :style
        end
    
    end
end