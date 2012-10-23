class Resource < ActiveRecord::Base
  belongs_to :user
  belongs_to :resource_type

  attr_accessible :name

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :type
  # has_many :properties

end
