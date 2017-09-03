class Organization
  include Mongoid::Document
  store_in collection: 'organization'
  field :organization, type: String
  attr_reader :organization_tokens 

  def organization_tokens=(names)
  	self.organization_names = names.split(",")
  end
end
