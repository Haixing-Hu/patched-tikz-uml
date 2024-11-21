# define contants
ORIGINAL_FILE = tikz-uml.v1.0-2016-03-29.sty
PATCH_FILE = umlcall.patch
OUTPUT_FILE = tikz-uml.sty
INSTALL_DIR = $(shell ./get_texmf_dir.sh)/tex/latex/tikzuml

# default target
all: patch install

# target: generate patched file
patch: $(OUTPUT_FILE)

$(OUTPUT_FILE): $(ORIGINAL_FILE) $(PATCH_FILE)
	@echo "Applying patch to $(ORIGINAL_FILE)..."
	patch $(ORIGINAL_FILE) $(PATCH_FILE) -o $(OUTPUT_FILE)
	@echo "Patched file created: $(OUTPUT_FILE)"

# target: install patched file
install: $(OUTPUT_FILE)
	@echo "Installing $(OUTPUT_FILE) to $(INSTALL_DIR)..."
	mkdir -p $(INSTALL_DIR)
	cp $(OUTPUT_FILE) $(INSTALL_DIR)
	@echo "Installed successfully!"

# target: clean up generated files
clean:
	rm -f $(OUTPUT_FILE)
	@echo "Cleaned up generated files."

# phony targets
.PHONY: all patch install clean