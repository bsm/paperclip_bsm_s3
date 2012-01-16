require 'paperclip'
require 'paperclip/storage/s3'
require 'aws/s3'

module Paperclip # :nodoc:

  @@default_s3_options = nil

  def self.default_s3_options
    @@default_s3_options ||= {
      :storage        => :s3,
      :url            => ":s3_domain_url",
      :s3_protocol    => 'https',
      :s3_credentials => Rails.root.join('config', 's3.yml').to_s,
      :path           => ":attachment/:id/:style.:extension"
    }
  end

  ClassMethods.module_eval do

    def has_s3_attached_file(name, options = {})
      has_attached_file name, options.reverse_merge(Paperclip.default_s3_options)
    end

  end
end

