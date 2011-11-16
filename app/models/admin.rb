class Admin < ActiveRecord::Base
  acts_as_authentic do |c|
      c.login_field = :name
    end 
  has_many :posts
     
end
