








# Define the name of the virtual environment directory
VENV_DIR = venv
REQ_FILE = requirements.txt

.PHONY: help create_venv activate install clean

help:
	@echo "Makefile for managing a Python virtual environment"
	@echo "Usage:"
	@echo "  make create_venv - Create a virtual environment"
	@echo "  make install      - Install dependencies from requirements.txt"
	@echo "  make clean        - Remove the virtual environment"

create_venv:
	python -m venv $(VENV_DIR)
	@echo "Virtual environment created in $(VENV_DIR)"
	@echo "To activate the virtual environment, run:"
	@echo "source $(VENV_DIR)/bin/activate"

install: create_venv
	$(VENV_DIR)/bin/pip install --upgrade pip
	$(VENV_DIR)/bin/pip install -r $(REQ_FILE)
	@echo "Dependencies installed from $(REQ_FILE)"

clean:
	rm -rf $(VENV_DIR)
	@echo "Removed virtual environment"
