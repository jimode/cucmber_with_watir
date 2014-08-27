# In the file puppy.rb
class Puppy < ActiveRecord::Base
	has_many :adoptions
end