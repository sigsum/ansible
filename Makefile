.venv:
	python -mvenv .venv
	. .venv/bin/activate; pip install -Ur requirements.txt

converge: .venv
	. .venv/bin/activate; molecule converge

destroy: .venv
	. .venv/bin/activate; molecule converge

.PHONY: converge destroy
