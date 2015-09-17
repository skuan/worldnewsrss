require 'feedjira'
require 'pry'
require 'csv'
require 'rubygems'
require 'tf_idf'


url_usa = %w[http://news.yahoo.com/rss/]
feeds_usa = Feedjira::Feed.fetch_and_parse url_usa

k_usa = feeds_usa.keys[0] # so i dont have to type in the key "http://rt.news/rss/news"

#console
feeds_usa[k_usa].entries.each do |entry| #feeds_usa[k].entries = array of entries
	puts "title: #{entry.title}"
	puts "url : #{entry.url}"
	puts "author : #{entry.author}"
	puts "date : #{entry.published}\n"
	puts "summary : #{entry.summary}"
	puts "======================================\n\n"  
end

#database
feeds_usa[k_usa].entries.each do |entry|
	article = Usa.create(title: entry.title, url: entry.url, author: entry.author, date: entry.published, summary: entry.summary )
end

#spreadsheet
CSV.open("yahoo_news_usa.csv", "wb") do |row|
	row << ["title", "url", "author", "date", "summary"]
	feeds_usa[k_usa].entries.each do |entry|
		row << [entry.title, entry.url, entry.author, entry.published, entry.summary]
	end
end

@yahoo_news = Usa.all


