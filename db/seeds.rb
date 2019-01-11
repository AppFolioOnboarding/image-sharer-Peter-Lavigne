20.times do |n|
  Image.create(url: "https://picsum.photos/300/200?image=#{n}")
end
