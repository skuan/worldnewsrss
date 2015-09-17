class PagesController < ApplicationController

require 'csv'


	def home 

	#RUSSIA PORTION
		url_r = %w[http://www.rt.com/rss/news/]
		feeds = Feedjira::Feed.fetch_and_parse url_r

		k = feeds.keys[0] # so i dont have to type in the key "http://rt.news/rss/news"

		#console
		feeds[k].entries.each do |entry| #feeds[k].entries = array of entries
			puts "title: #{entry.title}"
			puts "url : #{entry.entry_id}"
			puts "author : #{entry.author}"
			puts "date : #{entry.published}\n"
			puts "summary : #{entry.summary}"
			puts "======================================\n\n"  
		end

		#database
		feeds[k].entries.each do |entry|
			article = Russia.create(title: entry.title, url: entry.entry_id, author: entry.author, date: entry.published, summary: entry.summary )
		end

		#spreadsheet
		CSV.open("russia_times.csv", "wb") do |row|
			row << ["title", "url", "author", "date", "summary"]
			feeds[k].entries.each do |entry|
				row << [entry.title, entry.entry_id, entry.author, entry.published, entry.summary]
			end
		end

		@russian_times = Russia.all


	#CHINA PORTION
		url_ch = %w[http://www.xinhuanet.com/english/rss/worldrss.xml]
		feeds_ch = Feedjira::Feed.fetch_and_parse url_ch

		k_ch = feeds_ch.keys[0] 

		#console
		feeds_ch[k_ch].entries.each do |entry| 
			puts "title: #{entry.title}"
			puts "url : #{entry.url}"
			puts "author : #{entry.author}"
			puts "date : #{entry.published}\n"
			puts "summary : #{entry.summary}"
			puts "======================================\n\n"  
		end

		#database
		feeds_ch[k_ch].entries.each do |entry|
			article = China.create(title: entry.title, url: entry.url, author: entry.author, date: entry.published, summary: entry.summary )
		end

		#spreadsheet
		CSV.open("china.csv", "wb") do |row|
			row << ["title", "url", "author", "date", "summary"]
			feeds_ch[k_ch].entries.each do |entry|
				row << [entry.title, entry.url, entry.author, entry.published, entry.summary]
			end
		end

		@peoples_daily = China.all


	#INDIA PORTION
		url_in = %w[http://timesofindia.feedsportal.com/c/33039/f/533917/index.rss]
		feeds_in = Feedjira::Feed.fetch_and_parse url_in

		k_in = feeds_in.keys[0] # so i dont have to type in the key "http://rt.news/rss/news"
		
		#console
		feeds_in[k_in].entries.each do |entry| #feeds_in[k].entries = array of entries
			puts "title: #{entry.title}"
			puts "url : #{entry.entry_id}"
			puts "author : #{entry.author}"
			puts "date : #{entry.published}\n"
			puts "summary : #{entry.summary}"
			puts "======================================\n\n"  
		end

		#database
		feeds_in[k_in].entries.each do |entry|
			article = India.create(title: entry.title, url: entry.entry_id, author: entry.author, date: entry.published, summary: entry.summary )
		end

		#spreadsheet
		CSV.open("timesofindia.csv", "wb") do |row|
			row << ["title", "url", "author", "date", "summary"]
			feeds_in[k_in].entries.each do |entry|
				row << [entry.title, entry.entry_id, entry.author, entry.published, entry.summary]
			end
		end

		@times_of_india = India.all


	#USA PORTION
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



	#GERMANY PORTION

	#BRAZIL PORTION

	#INDONESIA PORTION





	end



end