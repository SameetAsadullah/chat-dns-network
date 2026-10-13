CXX := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -Wpedantic
THREAD_FLAGS := -pthread
BUILD_DIR := build
PROGRAMS := dns proxy-dns server-dns server client

.PHONY: all clean

all: $(addprefix $(BUILD_DIR)/,$(PROGRAMS)) $(BUILD_DIR)/IPs.txt

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/dns: src/DNS.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $< -o $@

$(BUILD_DIR)/proxy-dns: src/proxyDNS.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $< -o $@

$(BUILD_DIR)/server-dns: src/server-dns.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(THREAD_FLAGS) $< -o $@

$(BUILD_DIR)/server: src/server.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(THREAD_FLAGS) $< -o $@

$(BUILD_DIR)/client: src/client.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $< -o $@

$(BUILD_DIR)/IPs.txt: src/IPs.txt | $(BUILD_DIR)
	cp $< $@

clean:
	rm -rf $(BUILD_DIR)
