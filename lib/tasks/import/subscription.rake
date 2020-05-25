# frozen_string_literal: true

namespace :import do
  task subscription: :environment do
    time = Time.zone.now
    Subscription.active.where('end_time < ?', time).each do |subs|
      subs.update(is_active: false)
    end
  end
end
