require 'active_support'

# Core
require File.dirname(__FILE__) + '/asset_cloud/asset'
require File.dirname(__FILE__) + '/asset_cloud/metadata'
require File.dirname(__FILE__) + '/asset_cloud/bucket'
require File.dirname(__FILE__) + '/asset_cloud/buckets/blackhole_bucket'
require File.dirname(__FILE__) + '/asset_cloud/buckets/bucket_chain'
require File.dirname(__FILE__) + '/asset_cloud/buckets/file_system_bucket'
require File.dirname(__FILE__) + '/asset_cloud/buckets/invalid_bucket'
require File.dirname(__FILE__) + '/asset_cloud/buckets/memory_bucket'
require File.dirname(__FILE__) + '/asset_cloud/buckets/versioned_memory_bucket'
require File.dirname(__FILE__) + '/asset_cloud/base'


# Extensions
require File.dirname(__FILE__) + '/asset_cloud/free_key_locator'
require File.dirname(__FILE__) + '/asset_cloud/callbacks'
require File.dirname(__FILE__) + '/asset_cloud/validations'


AssetCloud::Base.class_eval do
  include AssetCloud::FreeKeyLocator
  include AssetCloud::Callbacks
  callback_methods :write, :delete
end

AssetCloud::Asset.class_eval do
  include AssetCloud::Callbacks
  callback_methods :store, :delete
  
  include AssetCloud::Validations
end

