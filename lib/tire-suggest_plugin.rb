require 'tire/suggest_plugin'

module Tire
  module DSL
    def suggest(indices=nil, options={}, &block)
      if block_given?
        Tire::SuggestPlugin::Suggest.new(indices, options, &block)
      elsif options.respond_to?(:to_hash)
        Tire::SuggestPlugin::Suggest.new(indices, options.to_hash)
      else
        raise ArgumentError, "Please pass a Ruby Hash or an object with `to_hash` method, not #{options.class}"
      end
    end
  end
end
