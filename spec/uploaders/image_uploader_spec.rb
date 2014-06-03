require 'spec_helper'
require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  before do
    ImageUploader.enable_processing = true
    user      = create(:user, role: "admin")
    @post     = create(:post, author_id: user.id)
    @uploader = ImageUploader.new(@post, :image)
    @uploader.store!(File.open(Rails.root.join("spec/support/hello-world.jpg")))
  end

  after do
    ImageUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the lage version' do
    it "should scale down a landscape image to fit within 800 by 800 pixels" do
      expect(@uploader.large).to be_no_wider_than(800)
      expect(@uploader.large).to be_no_taller_than(800)
    end
  end

  context 'the medium version' do
    it "should scale down a landscape image to fit within 300 by 300 pixels" do
      expect(@uploader.medium).to be_no_wider_than(300)
      expect(@uploader.medium).to be_no_taller_than(300)
    end
  end

  context 'the small version' do
    it "should scale down a landscape image to fit within 100 by 100 pixels" do
      expect(@uploader.small).to be_no_wider_than(100)
      expect(@uploader.small).to be_no_taller_than(100)
    end
  end

  it "should make the image readable and writable only to the owner and not executable" do
    expect(@uploader).to have_permissions(0644)
  end

end