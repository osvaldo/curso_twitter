class User < ActiveRecord::Base
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :terms_of_service, :acceptance => true
  has_many :tweets
  has_many :mentions
  has_many :network_tweets, :through=> :mentions, :source=> :tweet
  has_and_belongs_to_many :favorited_tweets, :class_name=> "Tweet"
  
  has_many :retweets
  has_many :network_retweets, :through => :retweets
end
