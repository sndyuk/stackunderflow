require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Stackunderflow
  class Application < Rails::Application
    # 環境ごとに設定を上書きするためのファイルはこちらへ: config/environments/*.rb
    # アプリの初期設定をするためのファイルはこちらへ: config/initializers/*.rb

    config.active_record.raise_in_transactional_callbacks = true
    config.lograge.enabled = true
  end
end
