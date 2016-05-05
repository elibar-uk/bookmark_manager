# require_relative '../data_mapper_setup'
# require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'
# require_relative '../data_mapper_setup'

class Link
  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :title, String
  property :url, String
end

# # DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
# DataMapper.finalize
# DataMapper.auto_upgrade!

# link = Link.create(link: "http://www.makersacademy.com/", title: 'Makers')
