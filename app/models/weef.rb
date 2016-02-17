class Weef

  attr_reader :id
  attr_accessor :name, :text, :emotion_id

  def initialize(hash)
    @id = hash["id"]
    @name = hash["name"]
    @text = hash["text"]
    @emotion_id = hash["emotion_id"]
  end

  def name_and_id
    "#{name} (#{id})"
  end

  def crazy_name
    "#{name}, that's crazy!!!!!"
  end

  def destroy
    Unirest.delete("https://obscure-plateau-60697.herokuapp.com/posts/#{id}").body
  end
  
  def self.find(id)
    Weef.new(Unirest.get("https://obscure-plateau-60697.herokuapp.com/posts/#{id}").body)
  end

  def self.all

    # Unirest.get("https://obscure-plateau-60697.herokuapp.com/posts").body.map { |api_post| Weef.new(api_post) } 

    api_posts_array = Unirest.get("https://obscure-plateau-60697.herokuapp.com/posts").body
    posts = []
    api_posts_array.each do |api_post|
      posts << Weef.new(api_post)
    end
    return posts
  end


end