# In the file adoption.rb
class Adoption < ActiveRecord::Base
	belongs_to :order
	belongs_to :puppy
end