# frozen_string_literal: true

module HumanizeHelper
  def st_badge(state)
    state ? "<span class='label label-success'>#{t('active')}</span>" : "<span class='label label-danger'>#{t('passive')}</span>"
  end

  def status(state)
    (state ? "<i class='fa fa-check' style='color: green'></i> #{t('active')}" : "<i class='fa fa-times' style='color: red'></i> #{t('passive')}").html_safe
  end

  def approval(state)
    (state ? "<i class='fa fa-check' style='color: green'></i> #{t('approved')}" : "<i class='fa fa-times' style='color: red'></i> #{t('not_approved')}").html_safe
  end

  def colorize_stage(stage)
    "<i style='color: #{stage.try :color}; background: white;padding: 5px; border: 1px solid #{stage.try :color};' class='fa fa-#{stage.try :icon}'></i><span style='background: #{stage.try :color}; padding: 4px; color: white;'>#{stage.try :name}</span>".html_safe
  end

  def phone_tr(phone)
    number_to_phone phone, area_code: true, country_code: 90, delimiter: ' '
  end
end
