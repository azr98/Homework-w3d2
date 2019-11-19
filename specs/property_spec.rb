require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/Property.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class PropertyTest < MiniTest::Test

  def test_can_create_new_property
    property_details
  end
