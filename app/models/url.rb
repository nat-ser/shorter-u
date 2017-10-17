class Url < ApplicationRecord

  URL_REGEX = /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/.freeze

  validates :full_address, presence: true
  validates :full_address, format: { with: URL_REGEX, message: "does not seem to be a valid url" }

  def self.find_by_friendly_id(params)
    find params[:friendly_id].to_i(36)
  end

  def increment_visit_count
    increment!(:visit_count)
  end

  def to_param
    id.to_s(36)
  end
end
