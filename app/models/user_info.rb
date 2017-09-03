class UserInfo
  include Mongoid::Document
  store_in collection: 'userInfo'
  field :lastName, type: String
  field :country, type: String
  field :lastOnlineTimeSeconds, type: Integer
  field :city, type: String
  field :rating, type: Integer
  field :friendOfCount, type: Integer
  field :titlePhoto, type: String
  field :handle, type: String
  field :avatar, type: String
  field :firstName, type: String
  field :contribution, type: Integer
  field :organization, type: String
  field :rank, type: String
  field :maxRating, type: Integer
  field :registrationTimeSeconds, type: Integer
  field :maxRank, type: String
  index({handle: 1, organization: 1})
end
