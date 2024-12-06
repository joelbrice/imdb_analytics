ENV = venv
PORT = 8501

.PHONY: all
all: install run

.PHONY: venv
venv:
	python3 -m venv $(ENV)
.PHONY: install
install: venv
$(ENV)/bin/pip install --upgrade pip
$(ENV)/bin/pip install -r requirements.txt

.PHONY: run
run:
	$(ENV)/bin/streamlit run $(APP) --server.port =$(PORT)

.PHONY: lint
lint:
	$(ENV) /bin/pip install pylint
	$(ENV)/bin/pylint $(APP)

.PHONY: clean
clean:
	rm -rf $(ENV) __pycache__ .streamlit

.PHONY: help
help:
	@echo "Usage"
	@echo " make venv"
	@echo " make install"
	@echo " make run"
	@echo " make lint"
	@echo " make clean"