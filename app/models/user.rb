class User < ActiveRecord::Base
  include LiveList
  filters :state
end
