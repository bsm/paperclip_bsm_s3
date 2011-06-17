require 'spec_helper'

describe "BSM's Paperclip S3 extensions" do

  it 'should have deafult S3 options' do
    Paperclip.default_s3_options.keys.should =~ [:storage, :path, :s3_protocol, :s3_credentials, :url]
  end

  it 'should create a default S3 configuration' do
    User.new.photo.options.slice(:s3_credentials, :path, :url, :storage, :s3_protocol).should == {
      :s3_credentials => File.expand_path("../config/s3.yml", __FILE__),
      :path           => ":attachment/:id/:style.:extension",
      :url            => ":s3_domain_url",
      :storage        => :s3,
      :s3_protocol    => "https"
    }
  end

  it 'should create expiring urls' do
    AWS::S3::S3Object.should_receive(:url_for).with(
      "photos/123/original.jpg",
      "bogus-bucket",
      :use_ssl    => true,
      :expires_in => 4600
    ).and_return('https://example.com/file')

    record = User.new do |r|
      r.id = 123
      r.photo_file_name = 'photo.jpg'
    end
    record.photo.expiring_url(:original, :expires_in => 4600).should == 'https://example.com/file'
  end

end
