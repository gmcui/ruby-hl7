# encoding: UTF-8
$: << '../lib'
require 'test/unit'
require 'ruby-hl7'

class In1Segment < Test::Unit::TestCase
  def setup
    @base = "IN1|0001|K53||BLUE CROSS HSA/HRA PPO|PO BOX 35^^DURHAM^NC^27702^US||(800)214-4844^PRN^^^^800^2144844|075122|NEXT CARE URGENT|||20140106|||O|GRISWOLD^WALT^^^^^L|S^SELF|20130717|258 GLENN RD^^RALEIGH^NC^27610^US|||1||||||||HI||||||YPDW1420165312|||||||F||Y||S"
  end

  def test_read
    in1 = HL7::Message::Segment::IN1.new @base

    assert_equal(@base, in1.to_s)
    assert_equal('0001', in1.set_id)
    assert_equal('1', in1.coordination_of_benefits_priority)
    assert_equal('YPDW1420165312', in1.policy_number)
  end
  
  def test_create
    in1 = HL7::Message::Segment::IN1.new @base

    in1.set_id = '0001'
    assert_equal('0001', in1.set_id)

    in1.policy_number = 'YPDW1420165313'
    assert_equal('YPDW1420165313', in1.policy_number)
  end
end
