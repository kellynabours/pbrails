class BarcodeController < ApplicationController

	def download
		#setup filename
		if params['type']=='isbn' or params['type']='isbnprice'
                  type='isbn'
 		else
		  type='upc'
		end
		file='tmp/barcodes/'+type+"/"+params['code']+".eps"

		# Remove File if exists.
		if File.exists?(file)
			File.delete file
		end

		# Generate File
		if params['type']=='isbn'
			this->generateIsbnWOPrice(params['code'])
		else if params['type']=='isbnprice'
			this->generateIsbnWPrice(params['code'],params['price'])
		else if params['type']=='upc'
			this->generateUpcWOPrice(params['code'])
		else
			this->generateUpcWPrice(params['code'],params['price'])
		end

		# Serve File
		send_file file, filename: params['code']+".eps", type="application/eps"
	end

	def generateIsbnWPrice(isbn)
		filename="tmp/barcodes/isbn/"+isbn+".eps"
		isbncode=isbn.gsub('/_|-/','')
		pricecode=price.gsub('/\D/','')
		if pricecode==0
			pricecode=5
		end
		system( 'tbarcode --barcode=15 --output='+filename+' --data="'+isbncode+pricecode+'" --text=below --height=25.4 --fontsize=9 --colormode=GRAY')
	end

	def generateIsbnWOPrice(isbn)
		filename="tmp/barcodes/isbn/"+isbn+".eps"
		isbncode=isbn.gsub('/_|-/','')
		system ('tbarcode --barcode=13 --output='+filename+' --data="'+isbncode+'" --text=below --height=25.4 --fontsize=9 --colormode=GRAY')
	end

	def generateUpcWPrice(upc,price)
		filename="tmp/barcodes/upc/"+upc+".eps"
		upccode=upc.gsub('/_|-/','')
		pricecode=price.gsub('/\D/','')
		if pricecode==0
			pricecode=5
		end
		system ('tbarcode --barcode=36 --output='+filename+' --data="'+upccode+pricecode+'" --text=below --height=25.4 --fontsize=9 --colormode=GRAY')
	end

	def generateUpcWPrice(upc,price)
		filename="tmp/barcodes/upc/"+upc+".eps"
		upccode=upc.gsub('/_|-/','')
		pricecode=price.gsub('/\D/','')
		if pricecode==0
			pricecode=5
		end
		system ('tbarcode --barcode=34 --output='+filename+' --data="'+upccode+'" --text=below --height=25.4 --fontsize=9 --colormode=GRAY')
	end

end



