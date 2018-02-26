source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
#gem 'coffee-rails', '~> 4.2'
#20171127 windows上での不具合修正のため、追加　start
gem 'coffee-script-source', '~> 1.8.0'
#20171127 windows上での不具合修正のため、追加　end
#20171127 追加 start
gem 'jquery-rails'
gem 'bootstrap-sass'
#20171127 追加 end
#20171128 追加 start　画像登録
gem 'carrierwave', '~> 1.2.1'
#20171128 追加 end
#20171202 追加 start 開発補助
gem 'pry-rails', group: [:development, :test]
gem 'pry-byebug', group: [:development, :test]
gem 'hirb', group: [:development, :test]
gem 'hirb-unicode', group: [:development, :test]
gem 'better_errors', group: [:development, :test]
gem 'binding_of_caller', group: [:development, :test]
gem 'devise'
#20171202 追加 end
#20171210 追加 start 認証
gem 'devise-i18n'
gem 'bcrypt-ruby', '~> 3.0.0'
#20171210 追加 end
#20171213 追加 start ページング
gem 'kaminari', '~> 0.17.0'
gem 'kaminari-bootstrap', '~> 3.0.1'
#20171213 追加 end
#20180108 追加 start 論理削除 検索
gem 'paranoia', '~> 2.3', '>= 2.3.1'
gem 'ransack'
#20180108 追加 end
#20180109 追加 start 権限 管理画面
gem 'cancancan'
gem 'rails_admin'
#20180109 追加 end
#20180113 追加 start devise paranoiaの退会処理用
gem 'paranoia_uniqueness_validator', '3.0.0'
#20180113 追加 end
#20180120 追加 start エラーハンドリング
gem 'rambulance'
#20180120 追加 end
##20180218 追加 start セキュリティチェック
gem 'brakeman', require: false
gem 'secure_headers'
#20180218 追加 end

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  #20180204 追加 start テスト
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'poltergeist'
  gem 'database_cleaner', '1.6.1'
  gem 'faker'
  gem 'pry-coolline'
  #20180204 追加 end
  #20180218 追加 start テスト
  gem 'simplecov'
  #20180218 追加 end
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  #20180120 追加 start N+1対応
  gem 'rails_best_practices'
  gem 'bullet'
#20180120 追加 end N+1対応
#20180218 追加 start view パフォーマンスの確認 installできないのでいったんコメント
  #gem 'rack-lineprof'
  #gem 'rack-mini-profiler', require: false
#20180218 追加 end view パフォーマンスの確認 

#20180218 追加 start DB定義
  gem 'annotate'
#20180218 追加 end  DB定義
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
