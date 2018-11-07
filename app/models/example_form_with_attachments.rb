# frozen_string_literal: true

class ExampleFormWithAttachments

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :first_name, :mt_f_n, :last_name, :mt_l_n, :email, :phone_primary, :phone_cell, :message, :information_service, :attachments

  validates :mt_f_n,
          presence: { message: 'First name is requried.' }

  validates :mt_l_n,
          presence: { message: 'Last Name is required.' }

  validates :email,
          presence: { message: 'An Email is required'},
          format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/,
                    message: 'please enter a valid email: example@domain.com' }

  validates :phone_primary,
          presence: { message: "A Phone number is required"},
          format: { with: /\d{3}-\d{3}-\d{4}/,
                    message: "Please use the format: XXX-XXX-XXXX" }

  validates :message,
          presence: { message: 'Please include a message!' }

  validates :information_service,
          presence: { message: 'Please select information, or service needed' }

end
