module Tire::SuggestPlugin
  class Suggestions < Array
    def initialize(response={})
      super(response['suggestions'])
    end
  end
end
