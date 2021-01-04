# frozen_string_literal: true

require 'rails_helper'

describe FlickrPhoto do
  it_behaves_like 'a model with an aliased index name'
  it_behaves_like 'a photo with a type', 'flickr_photo'
end
