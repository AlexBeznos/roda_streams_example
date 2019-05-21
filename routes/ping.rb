class StreamingExample
  route "ping" do |r|
    r.get do
      require 'pry'; binding.pry
      r.halt 200, "pong"
    end
    r.post do
      require 'pry'; binding.pry
      r.halt 200
    end
  end
end
