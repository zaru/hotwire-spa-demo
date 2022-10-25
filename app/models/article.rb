class Article < ApplicationRecord
  broadcasts_to ->(_e) { 'articles' }, inserts_by: 'prepend', target: 'articles'
end
