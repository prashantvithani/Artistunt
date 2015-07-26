class History < ActiveRecord::Base
  belongs_to :user
  belongs_to :visited_artist
end
