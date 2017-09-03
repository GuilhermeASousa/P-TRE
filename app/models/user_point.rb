class UserPoint
  include Mongoid::Document
  store_in collection: 'userPoints'
  field :rating, type: Integer
  field :handle, type: String
  field :pontuation, type: Float
end
