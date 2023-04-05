.PHONY: deps test

deps:
	pip install -r requirements.txt; \
		pip install -r test_requirements.txt

tests:
	PYTHONPATH=. py.test
	PYTHONPATH=. FLASK_APP=hello_world flask run

run:
	python main.py

lint:
		flake8 hello_world test

activate:
	source .venv/bin/activate

docker_run:
	docker run --name hello-world-printer-dev -p 5000:5000 -d hello-world-printer

docker_build:
	docker build -t hello-world-printer

curl:
	curl 127.0.0.1:5000/
