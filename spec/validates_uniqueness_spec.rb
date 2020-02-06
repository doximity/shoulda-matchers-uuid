# frozen_string_literal: true

require "spec_helper"
require "support/example_app_helpers"

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    # Keep as many of these lines as are necessary:
    with.library :active_record
    with.library :active_model
  end
end

class CreateUserTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |table|
      table.binary :uuid
      table.string :name
    end
  end
end

class User < ActiveRecord::Base
  attribute :uuid, MySQLBinUUID::Type.new

  validates :uuid, uniqueness: true
  validates :name, uniqueness: { scope: :uuid }, allow_nil: true
end

RSpec.describe User, type: :model do
  include ExampleAppHelpers

  def formerly_failing_uuid
    uuid = SecureRandom.uuid
    uuid.chop + "f"
  end

  before(:all) do
    setup_example_app(CreateUserTable)
  end

  after(:all) do
    teardown_example_app
  end

  it "correctly validates uniqueness of uuid values" do
    expect(described_class.new(uuid: formerly_failing_uuid)).to validate_uniqueness_of(:uuid).ignoring_case_sensitivity
  end

  it "correctly validates uniqueness of scoped uuid values" do
    expect(described_class.new(uuid: formerly_failing_uuid, name: "Shenanigans")).
      to validate_uniqueness_of(:name).
      scoped_to(:uuid).ignoring_case_sensitivity
  end
end
