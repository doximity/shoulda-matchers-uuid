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

class CreateUserAndFavoriteTables < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |table|
      table.binary :uuid
      table.string :name
    end

    create_table :favorites do |table|
      table.integer :favoriteable_id, null: false
      table.string :favoriteable_type, null: false
    end
  end
end

class User < ActiveRecord::Base
  attribute :uuid, MySQLBinUUID::Type.new

  validates :uuid, uniqueness: true
  validates :name, uniqueness: { scope: :uuid }, allow_nil: true
end

class Favorite < ActiveRecord::Base
  belongs_to :favoriteable, polymorphic: true
  validates :favoriteable, presence: true
  validates :favoriteable_id, uniqueness: { scope: :favoriteable_type }
end

RSpec.describe User, type: :model do
  include ExampleAppHelpers

  def formerly_failing_uuid
    uuid = SecureRandom.uuid
    uuid.chop + "f"
  end

  before(:all) do
    setup_example_app(CreateUserAndFavoriteTables)
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

  it "correctly validates uniqueness of polymorphic attribute types" do
    user_uuid = SecureRandom.uuid
    user = described_class.create! uuid: user_uuid, name: "User #{user_uuid}"
    Favorite.create! favoriteable: user

    expect(Favorite.new).to validate_uniqueness_of(:favoriteable_id).scoped_to(:favoriteable_type)
  end
end
