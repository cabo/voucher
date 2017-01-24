#pyang -f tree ../ietf-voucher\@*.yang > ietf-voucher-tree.txt 
#pyang -f tree ../ietf-voucher-revocation\@*.yang > ietf-voucher-revocation-tree.txt 

pyang -p ../ -f tree --tree-print-groupings ../ietf-voucher\@*.yang | sed -e '2,3 d' -e 's/^    //' > ietf-voucher-tree.txt 

pyang -p ../ -f tree --tree-print-groupings ../ietf-voucher-revocation\@*.yang | sed -e '2,3 d' -e 's/^    //' > ietf-voucher-revocation-tree.txt

