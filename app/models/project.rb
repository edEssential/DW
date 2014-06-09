class Project < ActiveRecord::Base
  attr_accessible :client, :title, :description, :url
end
