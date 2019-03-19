class StreamingExample
  route "stream" do |r|
    r.get do
      response.headers["Content-Type"] = "text/event"
      chunks = Enumerator.new do |yielder|
        10.times do
          yielder << "Hello\n"
          sleep 1
        end
      end

      r.halt response.finish_with_body(chunks)
    end
  end
end
