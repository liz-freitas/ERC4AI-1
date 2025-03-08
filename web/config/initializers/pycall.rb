# frozen_string_literal: true

require 'pycall/import'
include PyCall::Import

module Python
  pyimport :sys
  sys.path.insert(0, './app/python/services')
  # sys.stdout = PyCall.eval("open('log/python.txt', 'at')")

  pyimport 'erc4ai_binary_service'
  pyimport 'erc4ai_multilabel_service'
end