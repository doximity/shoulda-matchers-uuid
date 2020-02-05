# frozen_string_literal: true

require "spec_helper"

RSpec.describe Shoulda::Matchers::Uuid do
  it "has a version number" do
    expect(Shoulda::Matchers::Uuid::VERSION).not_to be nil
  end
end
