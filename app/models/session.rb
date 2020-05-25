# frozen_string_literal: true

class Session < ApplicationRecord
  # relations
  belongs_to :child

  # scopes
  scope :active, -> { where(is_active: true) }

  # validations
  validate :check, on: :create

  def check
    #errors.add(:base, 'Tanımlı aylık paket var') unless child.packages.last.monthly? && !child.subscriptions.last.is_active?
    errors.add(:base, 'Mevcut bir oturum var') unless child.sessions.last.nil? || !child.sessions.last.is_active?
  end
end
