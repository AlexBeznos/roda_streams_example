class StreamingExample
  route "ping" do |r|
    r.get do
      r.halt 200, "pong"
    end
  end
end
