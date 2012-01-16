require 'spec_helper'

describe "BSM's Paperclip S3 extensions" do

  let :options_hash do
    options = User.new.photo.options
    options = options.instance_variables.inject({}) do |res, var|
      value = options.send :instance_variable_get, var
      res.update var.to_s.sub('@', '').to_sym => value
    end if defined?(Paperclip::Options)
    options.slice(:s3_credentials, :path, :url, :storage, :s3_protocol)
  end

  it 'should have deafult S3 options' do
    Paperclip.default_s3_options.keys.should =~ [:storage, :path, :s3_protocol, :s3_credentials, :url]
  end

  it 'should create a default S3 configuration' do
    options_hash.should == {
      :s3_credentials => File.expand_path("../config/s3.yml", __FILE__),
      :path           => ":attachment/:id/:style.:extension",
      :url            => ":s3_domain_url",
      :storage        => :s3,
      :s3_protocol    => "https"
    }
  end

end
