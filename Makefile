data.json: $(wildcard *.txt)
	./toJSON.sh > data.json

clean:
	rm -f data.json
