require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = 1

while 1
	url = "http://ked.tdk.org.tr/index.php?option=com_kisiadlari&arama=adlar&name=a&like=0&cinsi=0&turu=0&guid=TDK.GTS.50e5ba20a8dbc9.57842690&page=" + page.to_s
	doc = Nokogiri::HTML(open(url, "Cookie" => '9329ea86155afc4a09b1b04f0c092763=s4n19hphop52f1co6v38ls4cl5; sozluktabs=1; __utma=249093661.1429950432.1357228538.1357228538.1357228538.1; __utmb=249093661.4.10.1357228538; __utmc=249093661; __utmz=249093661.1357228538.1.1.utmcsr=tdk.gov.tr|utmccn=(referral)|utmcmd=referral|utmcct=/index.php'))

	if doc.at_css("title").text.downcase.include?("ana sayfa")
		puts "ANA SAYFAYA DONDUK :("
		exit
	end
	
	doc.css("#hor-minimalist-b a").each do |item|
		name = item.text[0...item.text.index('-')].strip
		gender = item.text[item.text.index('-')+3...-1]
		link = "http://ked.tdk.gov.tr/" + item[:href]
	
	  puts name + ", " + gender + " - " + link


		doc2 = Nokogiri::HTML(open(link, "Cookie" => '9329ea86155afc4a09b1b04f0c092763=p03l7sgl17bvq9c51daqfdiit4; sozluktabs=1; __utma=262392521.1455482295.1356211095.1357222187.1357231375.4; __utmb=262392521.1.10.1357231375; __utmc=262392521; __utmz=262392521.1356447081.2.2.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided)'))
	
		puts doc2.at_css("title").text
		
		if doc2.at_css("title").text.downcase.include?("ana sayfa")
			puts "ANA SAYFAYA DONDUK :("
			exit
		end
	
		doc2.css("#hor-minimalist-a").each do |detail|
			origin_index = detail.text.index("Köken:")
			gender_index = detail.text.index("Cinsiyet:")
			description_index = detail.text.index("Anlam:")
		
			origin = detail.text[origin_index+7...gender_index].strip
			description = detail.text[description_index+6...detail.text.length].strip
			puts "AYRINTI: " + detail.text
			puts "KOKEN:" + origin
			puts "ANLAM:" + description
		end

	end
end