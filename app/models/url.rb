class Url < ApplicationRecord
  validates :full_address, presence: true

  def base_translation_to_friendly_path
    ENV["BASE_URL"] + id.to_s(36)
  end

  def self.from_base_translation(params)
    find params[:friendly_path].to_i(36)
  end

  def increment_visit_count
    self.visit_count += 1
    self.save
  end
end
