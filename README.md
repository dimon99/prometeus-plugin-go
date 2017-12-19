# prometeus-plugin-go

Demo plugin for prometeus - does 'ls -la | wc -l'
Uses gorilla mux and the standard prometeus handler to process plugin output

Web server is listenin on 8181 port serve next locations:

/metrics
/info

Example:

http://localhost:8181/metrics
http://localhost:8181/info
