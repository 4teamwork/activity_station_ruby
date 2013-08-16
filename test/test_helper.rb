require "bundler/setup"
require "minitest/autorun"
require "minitest/mock"

# $: << File.expand_path("../../lib", __FILE__)
require "activity_station"
require "activity_station/testing"

ActivityStation::TestCase = Minitest::Spec
