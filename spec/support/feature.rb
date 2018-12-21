# frozen_string_literal: true

module CapybaraActions
  def submit
    find('input[name="commit"]').click
  end
end
