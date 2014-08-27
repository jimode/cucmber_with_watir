# In the file order.rb
class Order < ActiveRecord::Base
	has_many :adoptions
end