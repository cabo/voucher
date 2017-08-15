pyang --ietf --strict --max-line-length=70 ../ietf-voucher\@*.yang
pyang --canonical ../ietf-voucher\@*.yang
yanglint ../ietf-voucher\@*.yang

echo "Testing ex-file-voucher-ephemeral.json..."
yanglint -s ../ietf-voucher\@*.yang ex-file-voucher-ephemeral.json

echo "Testing ex-file-voucher-long-lived.json..."
yanglint -s ../ietf-voucher\@*.yang ex-file-voucher-long-lived.json


