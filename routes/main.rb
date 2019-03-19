class StreamingExample
  route do |r|
    r.root do
      view("welcome")
    end
    
    r.assets
    r.multi_route
  end
end
