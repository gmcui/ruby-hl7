# encoding: UTF-8
$: << '../lib'
require 'test/unit'
require 'ruby-hl7'

$LOAD_PATH.unshift File.expand_path('../', __FILE__)
require 'test_helper'

class AdvancedParsing < Test::Unit::TestCase
  def setup
  end

  def test_in1_segment
    adt_a08_file = open('./test_data/adt_a08.hl7')
    msg = HL7::Message.new adt_a08_file

    assert(!msg[:IN1].is_a?(Array))
    assert_equal('1', msg[:IN1].coordination_of_benefits_priority)
    assert_equal('YPDW1420165309', msg[:IN1].policy_number)
  end

  def test_in1_segments
    adt_a08_file = open('./test_data/adt_a08.multi_in1.hl7')
    msg = HL7::Message.new adt_a08_file

    assert(msg[:IN1].is_a?(Array))
    assert_equal('1', msg[:IN1].first.coordination_of_benefits_priority)
    assert_equal('YPDW1420165309', msg[:IN1].first.policy_number)
  end
end
