require 'test_helper'
require 'addressable/uri'

class MediafileTest < Test::Unit::TestCase  
  def test_should_know_attributes
    document_file = example_file('document_with_one_inline_ad.xml')
    document = VAST::Document.parse!(document_file)
    mediafile = VAST::Mediafile.new(document.at('MediaFile'))
    encoded_url = Addressable::URI.parse(Addressable::URI.encode("https://svastx.moatads.com/noblepeoplevpaid46792914/moatwrapper.js#vast=https%3a%2f%2fad.doubleclick.net%2fddm%2fpfadx%2fN9515.1913239STACKADAPT5%2fB25048622.289829800%3bsz%3d0x0%3bord%3d713234747%3bdc_lat%3d%3bdc_rdid%3d%3btag_for_child_directed_treatment%3d%3btfua%3d%3bdcmt%3dtext%2fxml%3bdc_sdk_apis%3d[APIFRAMEWORKS]%3bdc_omid_p%3d%5bOMIDPARTNER%5d%3bgdpr%3d${GDPR}%3bgdpr_consent%3d${GDPR_CONSENT_755}&level1=25048622&level2=Stack%20Adapt&level3=289829800&level4=vpaid_creative_unit&slicer1=undefined&slicer2=undefined&pcode=noblepeoplevpaid46792914&spvb=1&zMoatDcVastUrl=$%7bDC_VAST_URL%7d&apif=[APIFRAMEWORKS]")).to_s
    
    assert_equal encoded_url, mediafile.url.to_s
    assert_equal "firstFile", mediafile.id
    assert_equal "progressive", mediafile.delivery
    assert_equal "video/x-flv", mediafile.type
    assert_equal 400, mediafile.width
    assert_equal 300, mediafile.height
    assert_equal 500, mediafile.bitrate
    assert_equal "VPAID", mediafile.api_framework
    assert mediafile.scalable?
    assert mediafile.maintain_aspect_ratio?
  end
end