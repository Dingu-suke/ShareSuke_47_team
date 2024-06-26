FROM ruby:3.2.3

# Node.jsの公式リポジトリを追加し、YarnとNode.jsの指定バージョンをインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && curl -sL https://deb.nodesource.com/setup_19.x | bash - \
  && apt-get update -qq \
  && apt-get install -y build-essential nodejs yarn libvips

WORKDIR /app

# 環境変数を設定
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# GemfileとGemfile.lockをコピーし、依存関係をインストール
COPY Gemfile Gemfile.lock /app/
RUN bundle config --local set path 'vendor/bundle' \
  && bundle install
COPY package.json yarn.lock ./
RUN bundle install \
  && yarn install

# エントリポイントスクリプトを設定
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
# アプリケーションの残りの部分をコピー
COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]