require 'tire'
require 'tire/suggest_plugin/version'
require 'tire/suggest_plugin/params'
require 'tire/suggest_plugin/suggestions'

module Tire::SuggestPlugin
  class SuggestRequiestFailed < StandardError; end

  class Suggest
    def initialize(indices=nil, options={}, &block)
      @indices = Array(indices)

      @params = Params.new(options)
      if block_given?
        block.arity < 1 ? @params.instance_eval(&block) : block.call(@params)
      end
    end

    def suggestions
      @suggestions or (perform and @suggestions)
    end

    def perform
      response = Tire::Configuration.client.get(self.url, @params.to_json)
      if response.failure?
        STDERR.puts "[REQUEST FAILED] #{self.to_curl}\n"
        raise SuggestRequestFailed, response.to_s
      end
      @suggestions = Suggestions.new(MultiJson.load(response.body))
    end

    def url
      path = ['/', @indices.join(','), '_suggest'].join('/').squeeze('/')
      Tire::Configuration.url + path
    end

    def to_curl
      params_to_json_escaped = @params.to_json.gsub("'", '\u0027')
      "curl -X GET '#{url}' -d '#{params_to_json_escaped}'"
    end
  end
end
