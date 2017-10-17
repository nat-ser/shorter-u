class Url < ApplicationRecord

  URL_REGEX = /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/.freeze

  validates :full_address, presence: true
  validates :full_address, format: { with: URL_REGEX, message: "does not seem to be a valid url" }

  def base_translation_to_friendly_path
    ENV["BASE_URL"] + self.id.to_s(36)
  end

  def self.from_base_translation(params)
    find params[:friendly_path].to_i(36)
  end

  def increment_visit_count
    self.visit_count += 1
    self.save
  end
end
