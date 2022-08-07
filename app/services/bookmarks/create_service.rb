# frozen_string_literal: true

module Bookmarks
  class CreateService < ::ApplicationService
    def initialize(folder, params)
      super
      @folder = folder
      @params = params
    end

    def call
      tx_and_commit do
        @object = @folder.bookmarks.build @params
        @object.save
      end

      super
    end

    private

    def post_call
      broadcast_later [@folder, :bookmarks],
                      'bookmarks/created',
                      locals: { bookmark: @object }
    end
  end
end
