require_relative '../../streaming_example'

module Test
  module WebHelpers
    module_function

    def app
      StreamingExample.app
    end
  end
end

