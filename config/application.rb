require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

RubyVM::InstructionSequence.compile_option = {
  inline_const_cache: true,
  instructions_unification: true,
  operands_unification: true,
  peephole_optimization: true,
  specialized_instruction: true,
  stack_caching: false,
  tailcall_optimization: true,
  trace_instruction: false
}
puts '------------------------------------------------'
puts '---------- RubyVM Compile Options --------------'
puts '------------------------------------------------'
RubyVM::InstructionSequence.compile_option.each { |k, v| puts("#{k}##{v}") }
puts '------------------------------------------------'

module Stackunderflow
  class Application < Rails::Application
    # 環境ごとに設定を上書きするためのファイルはこちらへ: config/environments/*.rb
    # アプリの初期設定をするためのファイルはこちらへ: config/initializers/*.rb

    config.active_record.raise_in_transactional_callbacks = true
    config.lograge.enabled = true
  end
end
