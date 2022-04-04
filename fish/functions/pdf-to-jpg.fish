function pdf-to-jpg
	convert -density 200 $argv'.pdf' -quality 150 $argv'.jpg'
end
