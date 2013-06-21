module Tire::SuggestPlugin
  AVAILABLE_PARAMS = [:field, :term, :size]
  class Params < Struct.new(*AVAILABLE_PARAMS)

    def initialize(params={})
      AVAILABLE_PARAMS.each do |param_name|
        send("#{param_name}=", params[param_name])
      end
    end

    AVAILABLE_PARAMS.each do |param_name|
      define_method(param_name) do |value=nil|
        if value.nil?
          super()
        else
          send("#{param_name}=", value)
        end
      end
    end

    def to_json
      MultiJson.dump(self.to_hash)
    end

    def to_hash
      result = {}
      AVAILABLE_PARAMS.each do |param_name|
        result[param_name] = send(param_name)
      end
      result
    end
  end
end
