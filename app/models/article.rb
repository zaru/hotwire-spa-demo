class Article < ApplicationRecord
  broadcasts_to ->(e) { 'articles' }, inserts_by: 'prepend', target: 'articles'
end
