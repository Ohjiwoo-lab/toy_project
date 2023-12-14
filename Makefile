TARGET = toy_project

SYSTEM = ./system
UI = ./ui
WEB = ./web_server

CFLAGS = -I./ -I$(SYSTEM) -I$(UI) -I$(WEB)

OBJS = main.o $(SYSTEM)/system.o $(UI)/gui.o $(UI)/input.o $(WEB)/web.o

$(TARGET): $(OBJS)
	gcc -o $(TARGET) $(OBJS)

main.o: main.c
	gcc -g $(CFLAGS) -o main.o -c main.c

$(SYSTEM)/system.o: $(SYSTEM)/system_server.c
	gcc -g $(CFLAGS) -o $(SYSTEM)/system.o -c $(SYSTEM)/system_server.c

$(WEB)/web.o: $(WEB)/web_server.c
	gcc -g $(CFLAGS) -o $(WEB)/web.o -c $(WEB)/web_server.c

$(UI)/gui.o: $(UI)/gui.c
	gcc -g $(CFLAGS) -o $(UI)/gui.o -c $(UI)/gui.c

$(UI)/input.o: $(UI)/input.c
	gcc -g $(CFLAGS) -o $(UI)/input.o -c $(UI)/input.c

clean:
	rm $(OBJS) $(TARGET)