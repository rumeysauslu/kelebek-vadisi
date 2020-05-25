# frozen_string_literal: true

namespace :import do
  task session: :environment do
    time = Time.zone.now
    Session.active.where('checkout_time < ?', time).each do |session|
      session.update(is_active: false)
    end
  end
end
