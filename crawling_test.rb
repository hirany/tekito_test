# _*_ coding: utf-8 _*_
require 'anemone'
require 'nokogiri'
require 'kconv'

# クロールの起点となるURLを指定
urls = [
    "http://www.sonymusic.co.jp/"
]

opts = {
    depth_limit: 1,
    skip_query_strings: true,
    delay: 3
}

Anemone.crawl(urls, opts) do |anemone|

# 巡回済みの絞り込み
    anemone.focus_crawl do |page|
        page.links.keep_if do |link| 
            link.to_s.match(/artist/)
        end
    end


# 取得したページに対する処理
    anemone.on_every_page do |page|
        puts page.url
    end
end