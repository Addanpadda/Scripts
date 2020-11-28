#!/bin/bash
bid=$(curl -Ss "https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=ETH&to_currency=SEK&apikey=ZPJ6AMDJ3A37BTQS" | jq '."Realtime Currency Exchange Rate"."8. Bid Price" | tonumber | floor')
fcas_score=$(curl -Ss "https://www.alphavantage.co/query?function=CRYPTO_RATING&symbol=ETH&apikey=ZPJ6AMDJ3A37BTQS" | jq '."Crypto Rating (FCAS)"."4. fcas score" | tonumber')

case 1 in
	$(($fcas_score >= 900)))
		color="#00FF00";;
	$(($fcas_score >= 750)))
    	color="#CCFF00";;
	$(($fcas_score >= 650)))
    	color="#CCCC00";;
	$(($fcas_score >= 500)))
    	color="FFCC00#";;
	$(($fcas_score < 500)))
		color="#FF0000";;
esac

printf "%'.0fkr (%d)\n\n%s\n" $bid $fcas_score $color
