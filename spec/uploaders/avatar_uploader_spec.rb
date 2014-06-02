require 'spec_helper'
require 'carrierwave/test/matchers'

describe AvatarUploader do
  include CarrierWave::Test::Matchers

  let(:user) { FactoryGirl.create(:user) }

  before do
    AvatarUploader.enable_processing = true
    @uploader = AvatarUploader.new(user, :avatar)
    @uploader.store!(File.open(Rails.root.join("spec/support/avatar_test.jpeg")))
  end

  after do
    AvatarUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the lage version' do
    it "should scale down a landscape image to fit within 600 by 600 pixels" do
      expect(@uploader.medium).to be_no_wider_than(600)
      expect(@uploader.medium).to be_no_taller_than(600)
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

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 64 by 64 pixels" do
      expect(@uploader.thumb).to have_dimensions(64, 64)
    end

    it "should crop based on user dimensions" do
      crop_user = FactoryGirl.create(:user, crop_x: 0, crop_y: 0, crop_h: 480, crop_w: 480)
      uploader_crop = AvatarUploader.new(crop_user, :avatar)
      uploader_crop.store!(File.open(Rails.root.join("spec/support/avatar_test.jpeg")))
      expect(uploader_crop.thumb).to have_dimensions(64, 64)
    end
  end

  it "should make the image readable and writable only to the owner and not executable" do
    expect(@uploader).to have_permissions(0644)
  end

end