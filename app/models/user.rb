# frozen_string_literal: true

class User < ApplicationRecord

  after_destroy :ensure_an_admin_remains

  class Error < StandardError
  end

  validates :name, presence: true, uniqueness: true
  has_secure_password

  private

  def ensure_an_admin_remains
    raise Error, "Can't delete last user" if User.count.zero?
  end

end
