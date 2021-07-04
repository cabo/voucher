LIBDIR := lib
YANGDATE=2021-07-04
include $(LIBDIR)/main.mk

$(LIBDIR)/main.mk:
ifneq (,$(shell grep "path *= *$(LIBDIR)" .gitmodules 2>/dev/null))
        git submodule sync
        git submodule update $(CLONE_ARGS) --init
else
        git clone -q --depth 10 $(CLONE_ARGS) \
            -b main https://github.com/martinthomson/i-d-template $(LIBDIR)
endif

rfc8366bis.xml:: yang/ietf-voucher-latest.yang yang/ietf-voucher-tree-latest.txt

yang/ietf-voucher-latest.yang: ietf-voucher.yang
	mkdir -p yang
	sed -e 's/YYYY-MM-DD/'${YANGDATE}'/g' ietf-voucher.yang >yang/ietf-voucher-${YANGDATE}.yang
	ln -s -f ietf-voucher-${YANGDATE}.yang yang/ietf-voucher-latest.yang

yang/ietf-voucher-tree-latest.txt: yang/ietf-voucher-latest.yang
	mkdir -p yang
	pyang -f tree --tree-print-groupings yang/ietf-voucher-latest.yang > yang/ietf-voucher-tree-latest.txt



