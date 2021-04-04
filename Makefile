print docs:
	@echo "API DOCS: Extracting API surface";
	@lerna clean --y;
	@lerna run build
	@lerna run api-report;
	@echo "Generating Markdown Docs"
	GH_PAGES_CFG_EXISTS=$(test -f docs/_config.yml)
	@if [ "$(GH_PAGES_CFG_EXISTS)" = "true" ]; then	\
  	echo "GitHub pages config file DETECTED"	\
  	cp docs/_config.yml .; \
	fi;

	@yarn api-documenter markdown -i temp -o docs;

	@if [ "$(GH_PAGES_CFG_EXISTS)" = "true" ]; then	\
  	cp _config.yml docs/_config.yml; \
	fi