# frozen_string_literal: true

class Url < ApplicationRecord

  validates :full_address, presence: true
  validates :full_address, url: true

  def self.find_by_friendly_id(friendly_id)
    find friendly_id.to_i(36)
  end

  def increment_visit_count
    increment!(:visit_count)
  end

  def to_param
    id.to_s(36)
  end
end
