PYTHON_VENV = .venv/bin/python

USER_NAME = $(shell python3 scripts/author_name.py)
CURRENT_DATE = $(shell pipenv run python3 scripts/current_date.py)

module:
	@echo "Enter the template name:" && \
	read TEMPLATE_NAME && \
	echo "Enter the module name:" && \
	read MODULE_NAME && \
	"Scaffolding new '$$TEMPLATE_NAME' module '$$MODULE_NAME'" && \
	tuist scaffold '$$TEMPLATE_NAME' --name $$MODULE_NAME --author "$(USER_NAME)" --current-date "$(CURRENT_DATE)" \
#	tuist edit
