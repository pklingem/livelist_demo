class User < ActiveRecord::Base
  include LiveList
  initialize_filters :state
end
