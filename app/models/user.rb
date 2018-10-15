# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  username   :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
validates :username, :email, presence: true, uniqueness: true
# validates :username, uniquness: true

  has_many :shares,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

  has_many :shared_artwork,
    through: :shares,
    source: :artwork
end
