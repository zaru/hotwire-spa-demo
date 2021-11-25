class Article < ApplicationRecord
  broadcasts_to ->(e) { 'articles' }, inserts_by: 'append', target: 'articles'
end
