ogdf_path = ~/.libs/ogdf

CXX=g++
CXXFLAGS=-std=c++11 -pedantic -Wall -Wextra -O3 $(EXTRA_CXXFLAGS)
LINKS=-I $(ogdf_path)/include -L $(ogdf_path) -lOGDF -lpthread

rnb_tree: src/rnb_tree.c src/main.c
	$(CXX) -o bin/$@ $(CXXFLAGS) $^ $(LINKS)

rnbw_tree: src/rnb_tree.c src/rnbw_tree.c src/main.c
	$(CXX) -o bin/$@ $(CXXFLAGS) $^ $(LINKS)

ed_tree: src/rnb_tree.c src/rnbw_tree.c src/ed_tree.c src/main.c
	$(CXX) -o bin/$@ $(CXXFLAGS) $^ $(LINKS)

dyncon: src/rnb_tree.c src/rnbw_tree.c src/ed_tree.c src/dyn_con.c src/main.c
	$(CXX) -o bin/$@ $(CXXFLAGS) $^ $(LINKS)

dcgraph: src/rnb_tree.c src/rnbw_tree.c src/ed_tree.c src/et_tree.c src/dyn_con.c src/dc_main.cpp
	$(CXX) -g -o bin/$@ $(CXXFLAGS) $^ $(LINKS) -DDEBUG
