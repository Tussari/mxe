PKG             := cpptrace
$(PKG)_WEBSITE  := https://github.com/jeremy-rifkin/$(PKG)
$(PKG)_DESCR    := cpptrace
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.7.2
$(PKG)_CHECKSUM := 62835abfd91a840e4d212c850695b576523fe6f9036bc5c3e52183b6eb9905c5
$(PKG)_GH_CONF  := jeremy-rifkin/cpptrace/releases,v
$(PKG)_DEPS     := cc libdwarf zstd zlib

define $(PKG)_BUILD
    $(MAKE) -C '$(SOURCE_DIR)' -f $(PWD)/src/cpptrace-makefile \
        BUILD_DIR='$(BUILD_DIR)' \
        CXX='$(TARGET)-g++' \
        AR='$(TARGET)-ar' \
        PKGCONF='$(TARGET)-pkg-config' \
        PREFIX='$(PREFIX)/$(TARGET)' \
        -j $(JOBS) \
        install
endef
