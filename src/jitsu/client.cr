module Jitsu
  class Client
    property host = ""
    property token = ""

    def initialize(@host : String = "", @token : String = "")
    end

    def set_host(host : String)
      @host = host
    end

    def set_token(token : String)
      @token = token
    end

    # Returns the base url for which this client will make API requests to
    def base_url : URI
      URI.parse(host)
    end

    def get(path : String)
      HTTP::Client.new(base_url).get(path)
    end

    def post(path : String, body : Hash(String, String))
      HTTP::Client.new(base_url).post(path, headers: HTTP::Headers{"X-Auth-Token" => @token}, body: body.to_json)
    end
  end
end
